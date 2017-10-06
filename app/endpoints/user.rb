require './server/actions'

module User
  class << self
    @@db_table_name = :users
  end
end
