class AddDatesToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :expiration_date, :datetime
  end
end
