class ModifyPages < ActiveRecord::Migration
  def change
  	remove_column :pages, :content
  	rename_column :pages, :publish_date, :published_at
  	rename_column :pages, :expiration_date, :expired_at
  	rename_column :posts, :publish_date, :published_at
  	rename_column :posts, :expiration_date, :expired_at
  end
end
