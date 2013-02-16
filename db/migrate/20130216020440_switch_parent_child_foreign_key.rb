class SwitchParentChildForeignKey < ActiveRecord::Migration
  def self.up
    add_column :custom_pages, :parent_page_id, :integer
    remove_column :custom_pages, :parent_id

    remove_index :custom_pages, :name => :index_custom_pages_on_parent_id rescue ActiveRecord::StatementInvalid
    add_index :custom_pages, [:parent_page_id]
  end

  def self.down
    remove_column :custom_pages, :parent_page_id
    add_column :custom_pages, :parent_id, :integer

    remove_index :custom_pages, :name => :index_custom_pages_on_parent_page_id rescue ActiveRecord::StatementInvalid
    add_index :custom_pages, [:parent_id]
  end
end
