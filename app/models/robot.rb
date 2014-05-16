class Robot
  # attr_accessible :title, :body
  
  attr_accessor :port
  
  def connect
    port_file = ENV['BOT_PORT']#"/dev/tty.usbserial-A900cbdI"

    #this must be same as the baud rate set on the Arduino
    #with Serial.begin
    baud_rate = 115200
 
    data_bits = 8
    stop_bits = 1
    parity = SerialPort::NONE
 
    #create a SerialPort object using each of the bits of information
    begin
      port = SerialPort.new(port_file, baud_rate, data_bits, stop_bits, parity)
    rescue Exception => e
      port = false
    end
    
    if port
      port.write("H")
      return port
    else
      return false
    end
    #port.write("G 0 2000")
    #port.write("G 800 2000")
    #port.write("G 1600 2000")
    #port.write("G 2490 2000")
    #port.write("H")
  end
  
  def send(drink)
    port_file = ENV['BOT_PORT']#"/dev/tty.usbserial-A900cbdI"
    pos = [0,0,800,1600,2500,3300,4200,5050,5950,6850,7200,8000]
    unpoured = []
    #this must be same as the baud rate set on the Arduino
    #with Serial.begin
    baud_rate = 115200
 
    data_bits = 8
    stop_bits = 1
    parity = SerialPort::NONE
 
    #create a SerialPort object using each of the bits of information
    begin
      port = SerialPort.new(port_file, baud_rate, data_bits, stop_bits, parity)
    rescue Exception => e
      port = false
    end
    port.write("H")
    sleep(1)
    
    drink.amounts.each do |i|
      unpoured << [i.ingredient.name, i.ml]
    end
    dispensers = Dispenser.all
    dispensers.each do |d|
      drink.amounts.each do |i|
        if d.ingredient == i.ingredient
          length = (i.ml * 100) + 100
          port.write("G #{pos[d.position]} #{length}")
          #puts "G #{pos[d.position]} #{length}"
          sleep(1)
          unpoured.delete([i.ingredient.name, i.ml])
        else
          
        end
      end
    end
    port.write("H")
    unpoured.uniq
  end
end
