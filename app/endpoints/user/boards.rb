module User
  class Boards < Model::Show
    validate_fields :id

    def fetch
      instance = super
      { boards: DB[:boards].where(user_id: params[:id]) }
    end
  end
end
