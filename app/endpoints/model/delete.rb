module Model
  class Delete < ::Server::Actions::Delete
    validate_fields :id
  end
end
