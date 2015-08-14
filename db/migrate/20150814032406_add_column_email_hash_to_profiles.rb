class AddColumnEmailHashToProfiles < ActiveRecord::Migration
  def change
  	add_column :profiles, :email_hash, :string
  end
end
