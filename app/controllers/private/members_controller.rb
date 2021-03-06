class Private::MembersController < Private::PrivateSiteController

  hobo_user_controller

  auto_actions :all

  before_filter :login_required, :except => [ :login, :forgot_password, :accept_invitation, :do_accept_invitation, :reset_password, :do_reset_password]

  def do_accept_invitation
    do_transition_action :accept_invitation do
      if this.valid?
        self.current_user = this
        flash[:notice] = t("hobo.messages.you_signed_up", :default=>"You have signed up")
      end
    end
  end

end
