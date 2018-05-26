module User
  class Delete < Model::Delete
    validate_fields :id
  end
end
