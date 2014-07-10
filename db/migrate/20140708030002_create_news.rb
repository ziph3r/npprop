class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
    	t.string :title
    	t.text :content
    	t.text :short_desc
    	t.boolean :is_publish
    	t.integer :cover_id
    	
      t.timestamps
    end
  end
end
