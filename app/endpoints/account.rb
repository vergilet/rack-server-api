require './server/actions'

module Account
  class << self
    @@db_table_name = :accounts
  end
end
