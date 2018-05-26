module Model
  class Put < ::Server::Actions::Put
    validate_fields :id
  end
end
