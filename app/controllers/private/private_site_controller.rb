class Private::PrivateSiteController < ApplicationController

  hobo_controller

  before_filter :login_required

  def index;
    @pictures = Photo.for_slideshow
    render 'private/index'
  end

  def login_required
    redirect_to home_page if current_user.guest?
  end

end