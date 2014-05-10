port_file = "/dev/tty.usbserial-A900cbdI"

#this must be same as the baud rate set on the Arduino
#with Serial.begin
baud_rate = 115200
 
data_bits = 8
stop_bits = 1
parity = SerialPort::NONE
 
#create a SerialPort object using each of the bits of information
port = SerialPort.new(port_file, baud_rate, data_bits, stop_bits, parity)

port.write("H")