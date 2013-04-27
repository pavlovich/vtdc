class Position < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name        :string
    description :rdtext
    timestamps
  end
  attr_accessible :name, :description, :member_id, :member

  belongs_to :member

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.logged_in?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
