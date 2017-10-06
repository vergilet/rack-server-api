require_relative '../account'

module Account
  class Show < ::Server::Actions::Show
    validate_fields :id
  end
end
