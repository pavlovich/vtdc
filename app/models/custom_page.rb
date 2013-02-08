class CustomPage < ActiveRecord::Base

  hobo_model # Don't put anything above this

  extend FriendlyId

  fields do
    menu_title                        :string
    title                             :string
    description                       :string
    contents                          :text
    display_children_on_side_menu     :boolean
    display_children_as_dropdown_menu :boolean
    visible_to_public                 :boolean
    slug                              :string
    timestamps
  end
  attr_accessible :menu_title, :title, :description, :contents, :display_children_on_side_menu, :display_children_as_dropdown_menu, :visible_to_public

  friendly_id :menu_title, use: :slugged

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
