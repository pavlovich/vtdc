class MemberProfile < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    bio :cktext
    timestamps
  end

  attr_accessible :member, :member_id, :bio, :positions

  belongs_to :member

  has_many :positions, :through => :member

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
    acting_user.administrator? || acting_user == self
  end

  def update_permitted?
    acting_user.administrator? || acting_user == self
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    return  acting_user.administrator? if field == :member || field == :member_id
    true
  end

end
