class PhotosController < ApplicationController

  hobo_model_controller

  auto_actions :all, :except => [:new, :create, :delete, :edit, :index]

end
