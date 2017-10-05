require './server/actions/create'

module User
  class Create < ::Server::Actions::Create
    db_name :users
    validate_fields :email, :phone_number
  end
end