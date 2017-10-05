require './server/actions/show'

module User
  class Show < ::Server::Actions::Show
    db_name :users
    validate_fields :id
  end
end