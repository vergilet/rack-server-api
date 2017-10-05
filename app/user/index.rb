require './server/actions/index'

module User
  class Index < ::Server::Actions::Index
    db_name :users
  end
end