# This is an auto-generated file: don't edit!
# You can add your own routes in the config/routes.rb file
# which will override the routes in this file.

Vtdc::Application.routes.draw do


  # Resource routes for controller announcements
  resources :announcements, :only => [:show]


  # Resource routes for controller calendars
  resources :calendars, :only => [:index, :show]


  # Resource routes for controller documents
  resources :documents, :only => [:show]


  # Resource routes for controller events
  resources :events


  # Resource routes for controller member_profiles
  resources :member_profiles, :only => [:index, :show]


  # Resource routes for controller members
  resources :members, :only => [:show] do
    member do
      put 'accept_invitation', :action => 'do_accept_invitation'
      get 'accept_invitation'
      put 'reset_password', :action => 'do_reset_password'
      get 'reset_password'
    end
  end


  # Resource routes for controller photos
  resources :photos, :only => [:show]


  # Resource routes for controller positions
  resources :positions, :only => [:show]

  namespace :private do


    # Resource routes for controller private/announcements
    resources :announcements


    # Resource routes for controller private/calendars
    resources :calendars


    # Resource routes for controller private/custom_pages
    resources :custom_pages


    # Resource routes for controller private/documents
    resources :documents


    # Resource routes for controller private/events
    resources :events


    # Resource routes for controller private/member_profiles
    resources :member_profiles


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


    # Resource routes for controller private/positions
    resources :positions

  end



# These are the Hobo 1.3 style routes.   They've been included for backwards
# compatibility reasons because the names of some named routes have been changed.
# Please update your views to use the new named route names and then disable this
# section by setting config.hobo.dont_emit_deprecated_routes = true.  blah blah

 
 

  # DEPRECATED Resource routes for controller announcements
  get 'announcements/:id(.:format)' => 'announcements#show', :as => 'announcement', :constraints => { :id => %r([^/.?]+) }


  # DEPRECATED Resource routes for controller calendars
  get 'calendars(.:format)' => 'calendars#index', :as => 'calendars'
  get 'calendars/:id(.:format)' => 'calendars#show', :as => 'calendar', :constraints => { :id => %r([^/.?]+) }


  # DEPRECATED Resource routes for controller documents
  get 'documents/:id(.:format)' => 'documents#show', :as => 'document', :constraints => { :id => %r([^/.?]+) }


  # DEPRECATED Resource routes for controller events
  get 'events(.:format)' => 'events#index', :as => 'events'
  get 'events/new(.:format)' => 'events#new', :as => 'new_event'
  get 'events/:id/edit(.:format)' => 'events#edit', :as => 'edit_event'
  get 'events/:id(.:format)' => 'events#show', :as => 'event', :constraints => { :id => %r([^/.?]+) }
  post 'events(.:format)' => 'events#create', :as => 'create_event'
  put 'events/:id(.:format)' => 'events#update', :as => 'update_event', :constraints => { :id => %r([^/.?]+) }
  delete 'events/:id(.:format)' => 'events#destroy', :as => 'destroy_event', :constraints => { :id => %r([^/.?]+) }


  # DEPRECATED Resource routes for controller member_profiles
  get 'member_profiles(.:format)' => 'member_profiles#index', :as => 'member_profiles'
  get 'member_profiles/:id(.:format)' => 'member_profiles#show', :as => 'member_profile', :constraints => { :id => %r([^/.?]+) }


  # DEPRECATED Resource routes for controller members
  get 'members/:id(.:format)' => 'members#show', :as => 'member', :constraints => { :id => %r([^/.?]+) }


  # DEPRECATED Resource routes for controller photos
  get 'photos/:id(.:format)' => 'photos#show', :as => 'photo', :constraints => { :id => %r([^/.?]+) }


  # DEPRECATED Resource routes for controller positions
  get 'positions/:id(.:format)' => 'positions#show', :as => 'position', :constraints => { :id => %r([^/.?]+) }

  namespace :private do


    # DEPRECATED Resource routes for controller private/announcements
    get 'announcements(.:format)' => 'announcements#index', :as => 'announcements'
    get 'announcements/new(.:format)' => 'announcements#new', :as => 'new_announcement'
    get 'announcements/:id/edit(.:format)' => 'announcements#edit', :as => 'edit_announcement'
    get 'announcements/:id(.:format)' => 'announcements#show', :as => 'announcement', :constraints => { :id => %r([^/.?]+) }
    post 'announcements(.:format)' => 'announcements#create', :as => 'create_announcement'
    put 'announcements/:id(.:format)' => 'announcements#update', :as => 'update_announcement', :constraints => { :id => %r([^/.?]+) }
    delete 'announcements/:id(.:format)' => 'announcements#destroy', :as => 'destroy_announcement', :constraints => { :id => %r([^/.?]+) }


    # DEPRECATED Resource routes for controller private/calendars
    get 'calendars(.:format)' => 'calendars#index', :as => 'calendars'
    get 'calendars/new(.:format)' => 'calendars#new', :as => 'new_calendar'
    get 'calendars/:id/edit(.:format)' => 'calendars#edit', :as => 'edit_calendar'
    get 'calendars/:id(.:format)' => 'calendars#show', :as => 'calendar', :constraints => { :id => %r([^/.?]+) }
    post 'calendars(.:format)' => 'calendars#create', :as => 'create_calendar'
    put 'calendars/:id(.:format)' => 'calendars#update', :as => 'update_calendar', :constraints => { :id => %r([^/.?]+) }
    delete 'calendars/:id(.:format)' => 'calendars#destroy', :as => 'destroy_calendar', :constraints => { :id => %r([^/.?]+) }


    # DEPRECATED Resource routes for controller private/custom_pages
    get 'custom_pages(.:format)' => 'custom_pages#index', :as => 'custom_pages'
    get 'custom_pages/new(.:format)' => 'custom_pages#new', :as => 'new_custom_page'
    get 'custom_pages/:id/edit(.:format)' => 'custom_pages#edit', :as => 'edit_custom_page'
    get 'custom_pages/:id(.:format)' => 'custom_pages#show', :as => 'custom_page', :constraints => { :id => %r([^/.?]+) }
    post 'custom_pages(.:format)' => 'custom_pages#create', :as => 'create_custom_page'
    put 'custom_pages/:id(.:format)' => 'custom_pages#update', :as => 'update_custom_page', :constraints => { :id => %r([^/.?]+) }
    delete 'custom_pages/:id(.:format)' => 'custom_pages#destroy', :as => 'destroy_custom_page', :constraints => { :id => %r([^/.?]+) }


    # DEPRECATED Resource routes for controller private/documents
    get 'documents(.:format)' => 'documents#index', :as => 'documents'
    get 'documents/new(.:format)' => 'documents#new', :as => 'new_document'
    get 'documents/:id/edit(.:format)' => 'documents#edit', :as => 'edit_document'
    get 'documents/:id(.:format)' => 'documents#show', :as => 'document', :constraints => { :id => %r([^/.?]+) }
    post 'documents(.:format)' => 'documents#create', :as => 'create_document'
    put 'documents/:id(.:format)' => 'documents#update', :as => 'update_document', :constraints => { :id => %r([^/.?]+) }
    delete 'documents/:id(.:format)' => 'documents#destroy', :as => 'destroy_document', :constraints => { :id => %r([^/.?]+) }


    # DEPRECATED Resource routes for controller private/events
    get 'events(.:format)' => 'events#index', :as => 'events'
    get 'events/new(.:format)' => 'events#new', :as => 'new_event'
    get 'events/:id/edit(.:format)' => 'events#edit', :as => 'edit_event'
    get 'events/:id(.:format)' => 'events#show', :as => 'event', :constraints => { :id => %r([^/.?]+) }
    post 'events(.:format)' => 'events#create', :as => 'create_event'
    put 'events/:id(.:format)' => 'events#update', :as => 'update_event', :constraints => { :id => %r([^/.?]+) }
    delete 'events/:id(.:format)' => 'events#destroy', :as => 'destroy_event', :constraints => { :id => %r([^/.?]+) }


    # DEPRECATED Resource routes for controller private/member_profiles
    get 'member_profiles(.:format)' => 'member_profiles#index', :as => 'member_profiles'
    get 'member_profiles/new(.:format)' => 'member_profiles#new', :as => 'new_member_profile'
    get 'member_profiles/:id/edit(.:format)' => 'member_profiles#edit', :as => 'edit_member_profile'
    get 'member_profiles/:id(.:format)' => 'member_profiles#show', :as => 'member_profile', :constraints => { :id => %r([^/.?]+) }
    post 'member_profiles(.:format)' => 'member_profiles#create', :as => 'create_member_profile'
    put 'member_profiles/:id(.:format)' => 'member_profiles#update', :as => 'update_member_profile', :constraints => { :id => %r([^/.?]+) }
    delete 'member_profiles/:id(.:format)' => 'member_profiles#destroy', :as => 'destroy_member_profile', :constraints => { :id => %r([^/.?]+) }


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


    # DEPRECATED Resource routes for controller private/positions
    get 'positions(.:format)' => 'positions#index', :as => 'positions'
    get 'positions/new(.:format)' => 'positions#new', :as => 'new_position'
    get 'positions/:id/edit(.:format)' => 'positions#edit', :as => 'edit_position'
    get 'positions/:id(.:format)' => 'positions#show', :as => 'position', :constraints => { :id => %r([^/.?]+) }
    post 'positions(.:format)' => 'positions#create', :as => 'create_position'
    put 'positions/:id(.:format)' => 'positions#update', :as => 'update_position', :constraints => { :id => %r([^/.?]+) }
    delete 'positions/:id(.:format)' => 'positions#destroy', :as => 'destroy_position', :constraints => { :id => %r([^/.?]+) }

  end

end
