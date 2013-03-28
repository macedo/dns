class CreateDomains < ActiveRecord::Migration
  def change
    create_table :domains do |t|
      t.string :name
      t.string :dns1
      t.string :dns2

      t.timestamps
    end
  end
end
