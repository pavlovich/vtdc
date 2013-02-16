class Admin::AdminSiteController < ApplicationController

  hobo_controller

  before_filter :admin_required, :except => [ :login, :forgot_password, :accept_invitation, :do_accept_invitation, :reset_password, :do_reset_password]

  private

  def admin_required
    redirect_to home_page unless current_user.administrator?
  end

end