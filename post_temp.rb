#数秒おきに温度をTwitterにつぶやく
#Hard ware : Arduino, 温度センサLM35DZ

#usr/bin/env ruby
require "rubygems"
require "arduino_firmata"
require "tw"
arduino = ArduinoFirmata.connect "Arduinoへのパス"
 
puts "firmata version #{arduino.version}"
client = Tw::Client.new
client.auth "Twitterユーザ名"

while true
  arduino.digital_write 13, true
  temp = arduino.analog_read(1)*100*5/1024
  puts temp
  client.tweet "現在の温度は #{temp}度だよ"
  sleep 5
end
