class MembersController < ApplicationController

  hobo_user_controller

  auto_actions :all, :except => [ :index, :new, :create ]

 before_filter :admin_required, :except => [ :login, :forgot_password, :accept_invitation, :do_accept_invitation, :reset_password, :do_reset_password]

  # Normally, members should be created via the user lifecycle, except
  #  for the initial user created via the form on the public screen on
  #  first run.  This method creates the initial user.
  #def create
  #  hobo_create do
  #    if valid?
  #      self.current_user = this
  #      flash[:notice] = t("hobo.messages.you_are_site_admin", :default=>"You are now the site administrator")
  #      redirect_to home_page
  #    end
  #  end
  #end

  def do_accept_invitation
    do_transition_action :accept_invitation do
      if this.valid?
        self.current_user = this
        flash[:notice] = t("hobo.messages.you_signed_up", :default=>"You have signed up")
        redirect_to home_page
      end
    end
  end

end
