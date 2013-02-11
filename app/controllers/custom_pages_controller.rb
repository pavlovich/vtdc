class CustomPagesController < ApplicationController

  hobo_model_controller

  auto_actions :all, :except => [ :index, :new, :create ]

end
