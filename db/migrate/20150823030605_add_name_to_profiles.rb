class AddNameToProfiles < ActiveRecord::Migration
  def change
  	add_column :profiles, :name, :string
  	remove_column :users, :name, :string
  end
end
