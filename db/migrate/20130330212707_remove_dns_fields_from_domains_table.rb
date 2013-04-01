class RemoveDnsFieldsFromDomainsTable < ActiveRecord::Migration
  def up
    ['dns1', 'dns2'].each { |field| remove_column :domains, field.to_sym }
  end

  def down
    ['dns1', 'dns2'].each { |field| add_column :domains, field.to_sym, :string }
  end
end
