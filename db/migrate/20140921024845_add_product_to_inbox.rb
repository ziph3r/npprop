class AddProductToInbox < ActiveRecord::Migration
  def change
  	add_column :inboxes, :product_id, :integer
  end
end
