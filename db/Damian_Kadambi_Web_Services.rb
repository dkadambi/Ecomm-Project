require 'HTTParty'

class Transit
  include HTTParty
  base_uri 'http://api.winnipegtransit.com/time.json?api-key=HYc0RVHAMkkdXKzyfZA'
  #http://api.winnipegtransit.com/home/api/services/time
end

  time = Transit.get(Transit.base_uri)
  
  puts "The current system time is #{time["time"]}"
  
  puts "Enter your Stops: "
  
  stops = gets
  
  puts "you have selected #{stops}"