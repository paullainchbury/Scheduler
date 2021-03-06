Scheduler::Application.routes.draw do
  
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

  devise_scope :user do
    # get "signup", to: "devise/sessions#new"
    get'signup', to: 'devise/registrations#new', as: 'signup'
    get'login', to: 'devise/sessions#new', as: 'login'
    get'logout', to: 'devise/sessions#destroy', as: 'logout'
  end

  get'/users', to: 'users#index', as: :users
  get'/profile', to: 'users#show', as: :profile

  resources :classrooms
  resources :courses
  resources :bookings

  get'/enrolment/:user_id', to: 'courses_users#new', as: :enrolment

  post'/enrolment/:user_id', to: 'courses_users#create', as: :create_enrolment

  delete '/enrolment/:user_id', to: 'courses_users#destroy', as: :delete_enrolment

  root to: 'courses#index'

  # new_courses_user GET    /courses_users/new(.:format)      courses_users#new


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
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
