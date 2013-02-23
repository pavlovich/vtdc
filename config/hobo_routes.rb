# This is an auto-generated file: don't edit!
# You can add your own routes in the config/routes.rb file
# which will override the routes in this file.

Vtdc::Application.routes.draw do


  # Resource routes for controller photos
  resources :photos, :only => [:show, :update, :destroy]


  # Resource routes for controller user_profiles
  resources :user_profiles, :only => [:index, :show, :update, :destroy]


  # Resource routes for controller users
  resources :users, :only => [:edit, :show, :create, :update, :destroy] do
    member do
      get 'account'
      put 'accept_invitation', :action => 'do_accept_invitation'
      get 'accept_invitation'
      put 'reset_password', :action => 'do_reset_password'
      get 'reset_password'
    end
  end

  # User routes for controller users
  match 'login(.:format)' => 'users#login', :as => 'user_login'
  get 'logout(.:format)' => 'users#logout', :as => 'user_logout'
  match 'forgot_password(.:format)' => 'users#forgot_password', :as => 'user_forgot_password'

  namespace :admin do


    # Resource routes for controller admin/custom_pages
    resources :custom_pages


    # Resource routes for controller admin/photos
    resources :photos


    # Resource routes for controller admin/user_profiles
    resources :user_profiles


    # Resource routes for controller admin/users
    resources :users do
      collection do
        post 'invite', :action => 'do_invite'
        get 'invite'
      end
      member do
        get 'account'
      end
    end

    # User routes for controller admin/users
    match 'login(.:format)' => 'users#login', :as => 'user_login'
    get 'logout(.:format)' => 'users#logout', :as => 'user_logout'
    match 'forgot_password(.:format)' => 'users#forgot_password', :as => 'user_forgot_password'

  end

end
