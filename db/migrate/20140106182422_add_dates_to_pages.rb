class AddDatesToPages < ActiveRecord::Migration
  def change
    add_column :pages, :publish_date, :datetime
    add_column :pages, :expiration_date, :datetime
  end
end
