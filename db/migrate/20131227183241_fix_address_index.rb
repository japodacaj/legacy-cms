class FixAddressIndex < ActiveRecord::Migration
  def change
  	remove_index :addresses, :addressable_id
  	add_index :addresses, [:addressable_id, :addressable_type]
  end
end
