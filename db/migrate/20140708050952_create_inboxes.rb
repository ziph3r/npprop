class CreateInboxes < ActiveRecord::Migration
  def change
    create_table :inboxes do |t|
    	t.string :sender
    	t.string :title
    	t.text :message
    	t.boolean :is_deleted, :default => false
    	t.boolean :is_read, :default => false
      	t.timestamps
    end
  end
end
