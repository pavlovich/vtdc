module StaticHelper

  def show_sidebar?
    @custom_page && @custom_page.display_children_on_side_menu? # && !@custom_page.children.empty?
  end

end
