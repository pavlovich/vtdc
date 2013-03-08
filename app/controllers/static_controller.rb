class StaticController < ApplicationController

  hobo_controller

  before_filter :is_publicly_visible?

  def is_publicly_visible?
    custom_page = CustomPage.find(params[:id])
    render :error_page unless custom_page.publicly_visible? || !current_user.guest?
  end

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
      @custom_attributes[:aside_size]="0" if !@custom_page.show_aside?
      @custom_attributes[:show_top_menu]=@custom_page.show_top_menu?.to_s
      render
    else
      render :error_page
    end
  end

end
