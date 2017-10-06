require_relative '../user'

module User
  class Patch < ::Server::Actions::Patch
    validate_fields :id
  end
end
