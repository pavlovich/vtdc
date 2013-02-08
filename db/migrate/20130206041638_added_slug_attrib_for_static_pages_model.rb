class AddedSlugAttribForStaticPagesModel < ActiveRecord::Migration
  def self.up
    add_column :static_pages, :slug, :string
  end

  def self.down
    remove_column :static_pages, :slug
  end
end
