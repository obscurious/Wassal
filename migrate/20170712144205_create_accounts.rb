Sequel.migration do
  change do
    create_table :accounts do
      primary_key :id
      column :name, String, unique: true
    end
  end
end
