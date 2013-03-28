class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :name
      t.string :value
      t.integer :domain_id

      t.timestamps
    end
  end
end
