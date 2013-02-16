class StaticController < ApplicationController

  hobo_controller

  def show_custom_content()
    begin
      @custom_page = CustomPage.find(params[:id])
    rescue Exception => exc
      @custom_page = nil
    end

    if @custom_page
      @custom_attributes = {}
      @custom_attributes[:title]=@custom_page.title
      @custom_attributes[:full_title]="VTDC : #{@custom_page.title}"
      @custom_attributes[:aside_location]=@custom_page.aside_position
      @custom_attributes[:show_aside]=@custom_page.show_aside?.to_s
      @custom_attributes[:show_top_menu]=@custom_page.show_top_menu?.to_s
      render
    else
      render :error_page
    end
  end

end
