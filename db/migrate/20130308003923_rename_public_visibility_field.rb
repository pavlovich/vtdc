class RenamePublicVisibilityField < ActiveRecord::Migration
  def self.up
    add_column :custom_pages, :publicly_visible, :boolean
    remove_column :custom_pages, :visible_to_public
  end

  def self.down
    remove_column :custom_pages, :publicly_visible
    add_column :custom_pages, :visible_to_public, :boolean
  end
end
