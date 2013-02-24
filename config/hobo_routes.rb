# This is an auto-generated file: don't edit!
# You can add your own routes in the config/routes.rb file
# which will override the routes in this file.

Vtdc::Application.routes.draw do


  # Resource routes for controller members
  resources :members, :only => [:edit, :show, :create, :update, :destroy] do
    member do
      get 'account'
      put 'accept_invitation', :action => 'do_accept_invitation'
      get 'accept_invitation'
      put 'reset_password', :action => 'do_reset_password'
      get 'reset_password'
    end
  end

  # User routes for controller members
  match 'member_login(.:format)' => 'members#login', :as => 'member_login'
  get 'member_logout(.:format)' => 'members#logout', :as => 'member_logout'
  match 'member_forgot_password(.:format)' => 'members#forgot_password', :as => 'member_forgot_password'


  # Resource routes for controller photos
  resources :photos, :only => [:show, :update, :destroy]


  # Resource routes for controller user_profiles
  resources :user_profiles, :only => [:show, :update, :destroy]

  namespace :private do


    # Resource routes for controller private/custom_pages
    resources :custom_pages


    # Resource routes for controller private/members
    resources :members do
      collection do
        post 'invite', :action => 'do_invite'
        get 'invite'
      end
      member do
        get 'account'
      end
    end

    # User routes for controller private/members
    match 'member_login(.:format)' => 'members#login', :as => 'member_login'
    get 'member_logout(.:format)' => 'members#logout', :as => 'member_logout'
    match 'member_forgot_password(.:format)' => 'members#forgot_password', :as => 'member_forgot_password'


    # Resource routes for controller private/photos
    resources :photos


    # Resource routes for controller private/user_profiles
    resources :user_profiles

  end

end
