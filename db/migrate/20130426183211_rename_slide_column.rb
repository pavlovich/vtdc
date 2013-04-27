class RenameSlideColumn < ActiveRecord::Migration
  def self.up
    add_column :photos, :slideshow, :boolean, :default => false
    remove_column :photos, :slide
    change_column :photos, :publicly_visible, :boolean, :default => true
  end

  def self.down
    remove_column :photos, :slideshow
    add_column :photos, :slide, :boolean
    change_column :photos, :publicly_visible, :boolean
  end
end
