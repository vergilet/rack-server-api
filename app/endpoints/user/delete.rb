require_relative '../user'

module User
  class Delete < ::Server::Actions::Delete
    validate_fields :id
  end
end
