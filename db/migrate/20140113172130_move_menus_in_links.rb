class MoveMenusInLinks < ActiveRecord::Migration
  def change
  	Link.find_each do |link|
			link.linkable_type = 'Menu'
			link.linkable_id = link.menu_id
			link.save!
     end
  end
end
