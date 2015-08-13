class AddColumnsToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :name, :string
    add_attachment :profiles, :image
    
    remove_column :users, "image_file_name"
    remove_column :users, "image_content_type"
    remove_column :users, "image_file_size"
    remove_column :users, "image_updated_at"
  end
end
