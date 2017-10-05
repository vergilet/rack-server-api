require './server/actions/patch'

module User
  class Patch < ::Server::Actions::Patch
    db_name :users
    validate_fields :id
  end
end