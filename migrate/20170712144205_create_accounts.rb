Sequel.migration do
  change do
    create_table(:account) do
      primary_key :id
      text        :name, unique: true
    end
  end
end
