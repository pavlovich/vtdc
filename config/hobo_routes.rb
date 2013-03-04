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



# These are the Hobo 1.3 style routes.   They've been included for backwards
# compatibility reasons because the names of some named routes have been changed.
# Please update your views to use the new named route names and then disable this
# section by setting config.hobo.dont_emit_deprecated_routes = true.  blah blah

 
 

  # DEPRECATED Lifecycle routes for controller members
  put 'members/:id/accept_invitation(.:format)' => 'members#do_accept_invitation', :as => 'do_member_accept_invitation'
  get 'members/:id/accept_invitation(.:format)' => 'members#accept_invitation', :as => 'member_accept_invitation'
  put 'members/:id/reset_password(.:format)' => 'members#do_reset_password', :as => 'do_member_reset_password'
  get 'members/:id/reset_password(.:format)' => 'members#reset_password', :as => 'member_reset_password'

  # DEPRECATED Show action routes for controller members
  get 'members/:id/account(.:format)' => 'members#account', :as => 'member_account'

  # DEPRECATED Resource routes for controller members
  get 'members/:id/edit(.:format)' => 'members#edit', :as => 'edit_member'
  get 'members/:id(.:format)' => 'members#show', :as => 'member', :constraints => { :id => %r([^/.?]+) }
  post 'members(.:format)' => 'members#create', :as => 'create_member'
  put 'members/:id(.:format)' => 'members#update', :as => 'update_member', :constraints => { :id => %r([^/.?]+) }
  delete 'members/:id(.:format)' => 'members#destroy', :as => 'destroy_member', :constraints => { :id => %r([^/.?]+) }


  # DEPRECATED Resource routes for controller photos
  get 'photos/:id(.:format)' => 'photos#show', :as => 'photo', :constraints => { :id => %r([^/.?]+) }
  put 'photos/:id(.:format)' => 'photos#update', :as => 'update_photo', :constraints => { :id => %r([^/.?]+) }
  delete 'photos/:id(.:format)' => 'photos#destroy', :as => 'destroy_photo', :constraints => { :id => %r([^/.?]+) }


  # DEPRECATED Resource routes for controller user_profiles
  get 'user_profiles/:id(.:format)' => 'user_profiles#show', :as => 'user_profile', :constraints => { :id => %r([^/.?]+) }
  put 'user_profiles/:id(.:format)' => 'user_profiles#update', :as => 'update_user_profile', :constraints => { :id => %r([^/.?]+) }
  delete 'user_profiles/:id(.:format)' => 'user_profiles#destroy', :as => 'destroy_user_profile', :constraints => { :id => %r([^/.?]+) }

  namespace :private do


    # DEPRECATED Resource routes for controller private/custom_pages
    get 'custom_pages(.:format)' => 'custom_pages#index', :as => 'custom_pages'
    get 'custom_pages/new(.:format)' => 'custom_pages#new', :as => 'new_custom_page'
    get 'custom_pages/:id/edit(.:format)' => 'custom_pages#edit', :as => 'edit_custom_page'
    get 'custom_pages/:id(.:format)' => 'custom_pages#show', :as => 'custom_page', :constraints => { :id => %r([^/.?]+) }
    post 'custom_pages(.:format)' => 'custom_pages#create', :as => 'create_custom_page'
    put 'custom_pages/:id(.:format)' => 'custom_pages#update', :as => 'update_custom_page', :constraints => { :id => %r([^/.?]+) }
    delete 'custom_pages/:id(.:format)' => 'custom_pages#destroy', :as => 'destroy_custom_page', :constraints => { :id => %r([^/.?]+) }


    # DEPRECATED Lifecycle routes for controller private/members
    post 'members/invite(.:format)' => 'members#do_invite', :as => 'do_member_invite'
    get 'members/invite(.:format)' => 'members#invite', :as => 'member_invite'

    # DEPRECATED Show action routes for controller private/members
    get 'members/:id/account(.:format)' => 'members#account', :as => 'member_account'

    # DEPRECATED Resource routes for controller private/members
    get 'members(.:format)' => 'members#index', :as => 'members'
    get 'members/new(.:format)' => 'members#new', :as => 'new_member'
    get 'members/:id/edit(.:format)' => 'members#edit', :as => 'edit_member'
    get 'members/:id(.:format)' => 'members#show', :as => 'member', :constraints => { :id => %r([^/.?]+) }
    post 'members(.:format)' => 'members#create', :as => 'create_member'
    put 'members/:id(.:format)' => 'members#update', :as => 'update_member', :constraints => { :id => %r([^/.?]+) }
    delete 'members/:id(.:format)' => 'members#destroy', :as => 'destroy_member', :constraints => { :id => %r([^/.?]+) }


    # DEPRECATED Resource routes for controller private/photos
    get 'photos(.:format)' => 'photos#index', :as => 'photos'
    get 'photos/new(.:format)' => 'photos#new', :as => 'new_photo'
    get 'photos/:id/edit(.:format)' => 'photos#edit', :as => 'edit_photo'
    get 'photos/:id(.:format)' => 'photos#show', :as => 'photo', :constraints => { :id => %r([^/.?]+) }
    post 'photos(.:format)' => 'photos#create', :as => 'create_photo'
    put 'photos/:id(.:format)' => 'photos#update', :as => 'update_photo', :constraints => { :id => %r([^/.?]+) }
    delete 'photos/:id(.:format)' => 'photos#destroy', :as => 'destroy_photo', :constraints => { :id => %r([^/.?]+) }


    # DEPRECATED Resource routes for controller private/user_profiles
    get 'user_profiles(.:format)' => 'user_profiles#index', :as => 'user_profiles'
    get 'user_profiles/new(.:format)' => 'user_profiles#new', :as => 'new_user_profile'
    get 'user_profiles/:id/edit(.:format)' => 'user_profiles#edit', :as => 'edit_user_profile'
    get 'user_profiles/:id(.:format)' => 'user_profiles#show', :as => 'user_profile', :constraints => { :id => %r([^/.?]+) }
    post 'user_profiles(.:format)' => 'user_profiles#create', :as => 'create_user_profile'
    put 'user_profiles/:id(.:format)' => 'user_profiles#update', :as => 'update_user_profile', :constraints => { :id => %r([^/.?]+) }
    delete 'user_profiles/:id(.:format)' => 'user_profiles#destroy', :as => 'destroy_user_profile', :constraints => { :id => %r([^/.?]+) }

  end

end
