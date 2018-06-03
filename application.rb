require './config/environment'
require './app/endpoints/model'
Dir['./app/endpoints/**/*.rb'].each { |file| require file }
Dir['./app/endpoints/**/**/*.rb'].each { |file| require file }

require './config/routes.rb'
