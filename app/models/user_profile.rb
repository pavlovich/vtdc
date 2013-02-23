class UserProfile < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    bio           :text
    publish_date  :date
    timestamps
  end

  attr_accessible :bio, :publish_date

  has_and_belongs_to_many :photos

  def self.attr_order
    return [:bio, :publish_date]
  end

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
    return false if [:top_photo_content_type, :top_photo_file_name, :top_photo_file_size, :top_photo_updated_at, :bottom_photo_content_type, :bottom_photo_file_name, :bottom_photo_file_size, :bottom_photo_updated_at].include? field
    true
  end

end
