require './server/actions'

Dir['./app/endpoints/model/*.rb'].each {|file| require file }

module Model
  class << self
    @@db_table_name = nil
  end

  def self.included(base)
    # implement some pluralization
    @@db_table_name = (base.name.downcase + 's').to_sym
  end
end
