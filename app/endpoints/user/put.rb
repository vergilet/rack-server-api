require_relative '../user'

module User
  class Put < ::Server::Actions::Put
    validate_fields :id
  end
end
