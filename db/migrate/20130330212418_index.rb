class Index < ActiveRecord::Migration
  def up
    execute "CREATE INDEX records_gin_values ON records USING GIN(values)"
  end

  def down
    execute "DROP INDEX records_gin_values"
  end
end
