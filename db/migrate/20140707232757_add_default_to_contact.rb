class AddDefaultToContact < ActiveRecord::Migration
  def change
  		add_column :contacts, :is_default, :boolean, :default => false
  end
end
