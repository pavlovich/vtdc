class AddCkeditorSupportAndCustomPageSnapshots < ActiveRecord::Migration
  def self.up
    add_column :custom_pages, :snapshot_file_name, :string
    add_column :custom_pages, :snapshot_content_type, :string
    add_column :custom_pages, :snapshot_file_size, :integer
    add_column :custom_pages, :snapshot_updated_at, :datetime

    add_column :ckeditor_assets, :data_updated_at, :datetime
    change_column :ckeditor_assets, :data_file_name, :string, :limit => 255, :null => true
    change_column :ckeditor_assets, :type, :string, :limit => 255
    change_column :ckeditor_assets, :created_at, :datetime, :null => true
    change_column :ckeditor_assets, :updated_at, :datetime, :null => true

    remove_index :ckeditor_assets, :name => :idx_ckeditor_assetable rescue ActiveRecord::StatementInvalid
    remove_index :ckeditor_assets, :name => :idx_ckeditor_assetable_type rescue ActiveRecord::StatementInvalid
    add_index :ckeditor_assets, [:assetable_type, :assetable_id]
    add_index :ckeditor_assets, [:type]
  end

  def self.down
    remove_column :custom_pages, :snapshot_file_name
    remove_column :custom_pages, :snapshot_content_type
    remove_column :custom_pages, :snapshot_file_size
    remove_column :custom_pages, :snapshot_updated_at

    remove_column :ckeditor_assets, :data_updated_at
    change_column :ckeditor_assets, :data_file_name, :string, :null => false
    change_column :ckeditor_assets, :type, :string, :limit => 30
    change_column :ckeditor_assets, :created_at, :datetime, :null => false
    change_column :ckeditor_assets, :updated_at, :datetime, :null => false

    remove_index :ckeditor_assets, :name => :index_ckeditor_assets_on_assetable_type_and_assetable_id rescue ActiveRecord::StatementInvalid
    remove_index :ckeditor_assets, :name => :index_ckeditor_assets_on_type rescue ActiveRecord::StatementInvalid
    add_index :ckeditor_assets, [:assetable_type, :assetable_id], :name => 'idx_ckeditor_assetable'
    add_index :ckeditor_assets, [:assetable_type, :type, :assetable_id], :name => 'idx_ckeditor_assetable_type'
  end
end
