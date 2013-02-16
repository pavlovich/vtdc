class AddParentChildRelationshipForCustomPages < ActiveRecord::Migration
  def self.up
    add_column :custom_pages, :parent_id, :integer

    add_index :custom_pages, [:parent_id]
  end

  def self.down
    remove_column :custom_pages, :parent_id

    remove_index :custom_pages, :name => :index_custom_pages_on_parent_id rescue ActiveRecord::StatementInvalid
  end
end
