class AddContactDetail < ActiveRecord::Migration
  def change
  	add_column :inboxes, :email, :string
  	add_column :inboxes, :phone, :string
  end
end
