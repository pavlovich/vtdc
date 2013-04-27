class MemberProfile < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    bio :rdtext
    timestamps
  end

  attr_accessible :member, :member_id, :bio, :positions_held

  belongs_to :member

  has_many :positions, :through => :member

  def positions_held
    positions
  end

  def self.attr_order
    return [:member, :member_id, :bio, :positions]
  end

  def current_positions
    member.current_positions
  end

  def position_history
    member.position_history
  end

  def name
    member ? member.name : "No Member Name Associated"
  end
  # --- Permissions --- #

  def create_permitted?
    acting_user.logged_in?
  end

  def update_permitted?
    acting_user.administrator? || acting_user == member
  end

  def destroy_permitted?
    acting_user.administrator? || acting_user == member
  end

  def view_permitted?(field)
    #return  acting_user.administrator? if field == :member || field == :member_id
    true
  end

end
