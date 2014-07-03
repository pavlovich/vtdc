class Photo < ActiveRecord::Base

  hobo_model # Don't put anything above this

  self.table_name = "ckeditor_assets"

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

  def name
    @caption
  end

  def name= (something)
    @caption=something
  end

  has_attached_file :data,
                    :url  => "photos.totaldoberman.com",
                    :path => "ckeditor_assets/pictures/:id/:style_:basename.:extension",
                    :styles => {
                        :thumb=> "100x100#",
                        :content => "300x300>",
                        :slide => "540x420" }

  attr_accessible :caption, :data, :data_url, :assetable_type

  #belongs_to :assetable, :polymorphic => true

  # --- Permissions --- #

  def create_permitted?
    true
  end

  def update_permitted?
    true
  end

  def destroy_permitted?
    true
  end

  def view_permitted?(field)
    true
  end

  def attribute_protected?(attribute)
    false
  end

end
