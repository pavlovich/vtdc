Vtdc::Application.routes.draw do

  mount RedactorRails::Engine => '/redactor_rails'

 # resources :eventsx

 # get "calendar/index"

  match ENV['RAILS_RELATIVE_URL_ROOT'] => 'public#index' if ENV['RAILS_RELATIVE_URL_ROOT']

  root :to => 'public#index'

  match 'members/:id/reset_password_from_email/:key' => 'members#reset_password', :as => 'reset_password_from_email'

  match 'members/:id/accept_invitation_from_email/:key' => 'members#accept_invitation', :as => 'accept_invitation_from_email'

  match 'members/:id/activate_from_email/:key' => 'members#activate', :as => 'activate_from_email'

  match 'search' => 'public#search', :as => 'site_search'

  match 'static/:id' => 'static#show_custom_content', :as => 'public_custom_page'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :private do
  #     # Directs /private/products/* to Admin::ProductsController
  #     # (app/controllers/private/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'

  namespace :private do

    root :to => 'private_site#index'

  end
end
