require './server/actions/delete'

module User
  class Delete < ::Server::Actions::Delete
    db_name :users
    validate_fields :id
  end
end