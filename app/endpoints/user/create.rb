module User
  class Create < Model::Create
    validate_fields :email, :phone_number
  end
end
