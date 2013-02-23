class Photo < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    caption :string
    public  :boolean
    timestamps
  end
  attr_accessible :caption, :public, :photo, :photo_url

  has_and_belongs_to_many :user_profiles

  def self.attr_order
    return [:caption, :public, :photo]
  end

  has_attached_file :photo,  :styles => {
      :thumb=> "100x100#",
      :small  => "150x150>",
      :medium => "300x300>",
      :slide => "540x420" }

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.administrator?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
