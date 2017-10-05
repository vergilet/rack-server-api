require './server/actions/put'

module User
  class Put < ::Server::Actions::Put
    db_name :users
    validate_fields :id
  end
end