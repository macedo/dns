class CreateNewRecordTableWithHstore < ActiveRecord::Migration
  def up
    drop_table :records
    create_table :records do |t|
      t.string :name
      t.hstore :values
      t.integer :domain_id

      t.timestamps
    end
  end

  def down
    drop_table :records
    create_table :records do |t|
      t.string :name
      t.string :value
      t.integer :domain_id

      t.timestamps
    end
  end
end
