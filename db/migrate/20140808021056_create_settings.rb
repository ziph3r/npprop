class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
    	t.string :slogan
    	t.text :contact_us_footer
    	t.text :contact_us 
    	t.text :address
    	t.text :call_us
    	t.text :email
      t.timestamps
    end
  end
end
