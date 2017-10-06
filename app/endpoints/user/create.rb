require_relative '../user'

module User
  class Create < ::Server::Actions::Create
    validate_fields :email, :phone_number
  end
end
