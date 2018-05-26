# Load environment
# Development by default

if ENV.fetch('RACK_ENV', nil).nil?
  require_relative 'environments/development.rb'
else
  begin
    require_relative "environments/#{ENV.fetch('RACK_ENV')}.rb"
  rescue LoadError
    require_relative 'environments/development.rb'
  end
end
