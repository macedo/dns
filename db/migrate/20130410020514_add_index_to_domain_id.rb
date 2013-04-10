class AddIndexToDomainId < ActiveRecord::Migration
  def change
    add_index :records, :domain_id
  end
end
