class Position < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name        :string
    description :cktext
    timestamps
  end
  attr_accessible :name, :description

  has_and_belongs_to_many :members

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
