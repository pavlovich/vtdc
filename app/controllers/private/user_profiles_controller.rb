class Private::UserProfilesController < Private::PrivateSiteController

  hobo_model_controller

  #before_filter :login_required

  auto_actions :all

end