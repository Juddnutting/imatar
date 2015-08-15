class MoveNameToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :name, :string
  	remove_column :profiles, :name
  end
end
