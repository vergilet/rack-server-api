Sequel.migration do
  change do
    create_table(:users) do
      primary_key :id
      String      :name,          size: 20, null: false
      String      :email,         size: 60, null: true
      String      :phone_number,  size: 20, null: true
      DateTime    :created_at,              null: false
      DateTime    :updated_at,              null: false
    end
  end
end
