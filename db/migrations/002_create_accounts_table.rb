Sequel.migration do
  change do
    create_table(:accounts) do
      primary_key :id
      String      :name,          size: 20,   null: false
      String      :description,   text: true, null: true
      DateTime    :created_at,                null: false
      DateTime    :updated_at,                null: false
    end
  end
end
