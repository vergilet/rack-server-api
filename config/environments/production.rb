# Use strings to set values

ENV['RACK_ENV'] = 'production'
puts "Load #{ENV['RACK_ENV']} mode"
