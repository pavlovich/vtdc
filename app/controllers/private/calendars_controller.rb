class Private::CalendarsController < Private::PrivateSiteController

  hobo_model_controller

  auto_actions :all, :except => :index

end
