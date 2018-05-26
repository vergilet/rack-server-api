require './server/actions'

Dir['./app/endpoints/model/*.rb'].each {|file| require file }


# Do @@db_table_name as table name for current module

module Model
  def db_table_name
    (self.name.downcase + 's').to_sym
  end
end
