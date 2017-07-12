Sequel.migration do
  change do
    create_table(:account) do
      primary_key :id
      string      :name, unique: true
    end
  end
end
