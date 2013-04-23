class Ckeditor::Asset < ActiveRecord::Base

  hobo_model

  include Ckeditor::Orm::ActiveRecord::AssetBase
  include Ckeditor::Backend::Paperclip

  fields do
    data_file_name :string, :null => false
    data_content_type :string
    data_file_size :string
    assetable_id :integer
    assetable_type :string, :limit => 30
    type :string, :limit => 30

    width :integer
    height :integer

    tags :string
    caption :string

    timestamps
  end


end
