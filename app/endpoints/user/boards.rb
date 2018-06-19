module User
  class Boards < Model::Show
    validate_fields :id
    def fetch

      user_id = params[:id]
      through = DB[:users_boards].where(user_id: user_id)
      DB[:boards].where(id: through.select(:board_id)).to_a
    end
  end
end
