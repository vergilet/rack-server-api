require_relative '../user'

module User
  class Show < ::Server::Actions::Show
    validate_fields :id
  end
end
