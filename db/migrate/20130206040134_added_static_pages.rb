class AddedStaticPages < ActiveRecord::Migration
  def self.up
    create_table :static_pages do |t|
      t.string   :menu_title
      t.string   :title
      t.string   :description
      t.text     :contents
      t.boolean  :display_children_as_sidebar
      t.boolean  :display_children_as_dropdown
      t.boolean  :viewable_by_public
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :static_pages
  end
end
