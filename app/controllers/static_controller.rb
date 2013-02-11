class StaticController < ApplicationController

  hobo_controller

  def show_custom_content()
    begin
      @custom_page = CustomPage.find(params[:id])
    rescue Exception => exc
      @custom_page = nil
    end

    if @custom_page
      if @custom_page.display_children_on_side_menu?
        render(:show_custom_content_with_sidebar)
      else
        render
      end
    else
      render :error_page
    end
  end

end
