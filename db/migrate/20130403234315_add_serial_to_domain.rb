class AddSerialToDomain < ActiveRecord::Migration
  def up
    add_column :domains, :serial, :integer
  end

  def down
    remove_column :domains, :serial
  end
end
