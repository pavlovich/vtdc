class Admin::UserProfilesController < ApplicationController

  hobo_model_controller

  before_filter :login_required

  auto_actions :all

end
