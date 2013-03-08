class Calendar < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name        :string
    description :string
    timestamps
  end
  attr_accessible :name, :description

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
