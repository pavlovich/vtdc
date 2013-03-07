class DropSnapshotFile < ActiveRecord::Migration
  def self.up
    remove_column :custom_pages, :snapshot_file_name
    remove_column :custom_pages, :snapshot_content_type
    remove_column :custom_pages, :snapshot_file_size
    remove_column :custom_pages, :snapshot_updated_at
  end

  def self.down
    add_column :custom_pages, :snapshot_file_name, :string
    add_column :custom_pages, :snapshot_content_type, :string
    add_column :custom_pages, :snapshot_file_size, :integer
    add_column :custom_pages, :snapshot_updated_at, :datetime
  end
end
