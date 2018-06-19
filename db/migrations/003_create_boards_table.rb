Sequel.migration do
  change do
    create_table(:boards) do
      primary_key :id
      String      :name,          size: 30,   null: false
      String      :description,   text: true, null: true
      DateTime    :created_at,                null: false
      DateTime    :updated_at,                null: false
    end

    create_table(:users_boards) do
      primary_key :id
      Integer     :user_id,     null: false
      Integer     :board_id,    null: false
      DateTime    :created_at,  null: false
      DateTime    :updated_at,  null: false
    end
  end
end
