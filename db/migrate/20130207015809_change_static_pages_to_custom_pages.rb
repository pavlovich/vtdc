class ChangeStaticPagesToCustomPages < ActiveRecord::Migration
  def self.up
    drop_table :static_pages

    create_table :custom_pages do |t|
      t.string   :menu_title
      t.string   :title
      t.string   :description
      t.text     :contents
      t.boolean  :display_children_on_side_menu
      t.boolean  :display_children_as_dropdown_menu
      t.boolean  :visible_to_public
      t.string   :slug
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    create_table "static_pages", :force => true do |t|
      t.string   "menu_title"
      t.string   "title"
      t.string   "description"
      t.text     "contents"
      t.boolean  "display_children_as_sidebar"
      t.boolean  "display_children_as_dropdown"
      t.boolean  "viewable_by_public"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "slug"
    end

    drop_table :custom_pages
  end
end
