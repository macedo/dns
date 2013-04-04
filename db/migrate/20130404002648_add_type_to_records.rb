class AddTypeToRecords < ActiveRecord::Migration
  def up
    add_column :records, :type, :string
    remove_column :records, :name
  end

  def down
    remove_column :records, :type
    add_column :records, :name, :string
  end
end
