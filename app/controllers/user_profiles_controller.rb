class UserProfilesController < ApplicationController

  hobo_model_controller

  auto_actions :all, :except => [:index, :new, :create, :delete, :edit]

end
