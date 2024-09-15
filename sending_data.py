import machine
import utime
import bluetooth
import struct
from machine import Pin, ADC

# Initialize ADC for LM35 sensor (connected to GPIO 26, ADC0)
adc = ADC(Pin(26))

# Initialize Bluetooth Low Energy (BLE)
ble = bluetooth.BLE()
ble.active(True)

# Define a GATT service and characteristic for temperature data
_TEMP_SERVICE_UUID = bluetooth.UUID(0x181A)  # Environmental Sensing Service
_TEMP_CHAR_UUID = bluetooth.UUID(0x2A6E)  # Temperature Measurement Characteristic

# Create a service with a temperature characteristic
temp_service = (
    _TEMP_SERVICE_UUID,
    (
        (_TEMP_CHAR_UUID, bluetooth.FLAG_READ | bluetooth.FLAG_NOTIFY),
    ),
)

services = (temp_service,)
((temp_handle,),) = ble.gatts_register_services(services)

connections = set()

# Helper function for BLE advertising payload
def advertising_payload(limited_disc=False, br_edr=False, name=None, services=None):
    payload = bytearray()

    def _append(adv_type, value):
        payload.extend(struct.pack('BB', len(value) + 1, adv_type) + value)

    _append(0x01, struct.pack('B', (0x02 if limited_disc else 0x04) + (0x18 if br_edr else 0x00)))

    if name:
        _append(0x09, name.encode())

    if services:
        for uuid in services:
            b = bytes(uuid)
            if len(b) == 2:
                _append(0x03, b)
            elif len(b) == 16:
                _append(0x07, b)

    return payload

# IRQ handler for BLE events
def irq(event, data):
    global connections
    if event == 1:  # _IRQ_CENTRAL_CONNECT
        conn_handle, _, _ = data
        connections.add(conn_handle)
        print("Device connected")
    elif event == 2:  # _IRQ_CENTRAL_DISCONNECT
        conn_handle, _, _ = data
        connections.remove(conn_handle)
        print("Device disconnected")
        # Start advertising again after disconnection
        advertise()

# Function to read temperature from LM35
def read_temperature():
    adc_value = adc.read_u16()  # Read ADC value (0-65535)
    voltage = adc_value * 3.3 / 65535  # Convert ADC value to voltage
    temperature = voltage * 100  # LM35 gives 10mV per degree Celsius
    return temperature

# Function to send temperature over Bluetooth
def send_temperature():
    if connections:
        temperature = read_temperature()
        print("Temperature: {:.2f} °C".format(temperature))
        temp_bytes = struct.pack("<h", int(temperature * 100))  # Pack temperature in centi-degrees
        for conn_handle in connections:
            ble.gatts_write(temp_handle, temp_bytes)  # Write temperature to the characteristic
            ble.gatts_notify(conn_handle, temp_handle)  # Notify any connected device

# Function to advertise BLE services
def advertise():
    name = 'PicoW Temp'  # Device name
    adv_data = advertising_payload(name=name, services=[_TEMP_SERVICE_UUID])
    ble.gap_advertise(100000, adv_data)  # Advertise every 100ms

# Set the BLE IRQ handler
ble.irq(irq)

# Start advertising
advertise()

# Main loop to read temperature and send over BLE every 5 seconds
while True:
    send_temperature()
    utime.sleep(5)  # Wait for 5 seconds before sending the next reading

