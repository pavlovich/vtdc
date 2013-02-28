class CustomPage < ActiveRecord::Base

  hobo_model # Don't put anything above this

  extend FriendlyId

  fields do
    menu_title                        :string
    title                             :string
    description                       :string
    contents                          :cktext, {:x => 'y'}
    display_children_on_side_menu     :boolean
    display_children_as_dropdown_menu :boolean
    visible_to_public                 :boolean
    slug                              :string
    timestamps
  end

  attr_accessible :menu_title, :title, :description, :contents, :display_children_on_side_menu, :display_children_as_dropdown_menu, :visible_to_public, :parent_page_id, :parent_page

  has_many :child_pages, :class_name => "CustomPage", :foreign_key => "parent_page_id"
  belongs_to :parent_page, :class_name => "CustomPage"

  friendly_id :menu_title, use: :slugged

  scope :top_level_pages, where("parent_page_id IS NULL")

  def aside_position
    'left'
  end

  def has_child_pages?
    !child_pages.empty?
  end

  def has_parent_page?
    !parent_page.nil?
  end

  def show_aside?
    display_children_on_side_menu? && has_child_pages?
  end

  def show_top_menu?
    display_children_as_dropdown_menu? && has_child_pages?
  end

  def menu_url
    "/static/#{slug}"
  end

  def top_menu_label
    return parent_page.top_menu_label unless !has_parent_page?
    return menu_title
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
    true
  end

end
