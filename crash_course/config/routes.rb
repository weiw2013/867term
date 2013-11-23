CrashCourse::Application.routes.draw do

  get "course/browse"
  get "course/add"
  get "enrollment/add_one"
  get "enrollment/delete_one"
  get "enrollment/show_one"
  get "enrollment/show_all"
  get "comment/add_one"
  get "comment/edit_one"
  get "comment/delete_one"
  get "comment/show_one"
  get "comment/show_all"
  get "course/add_one"
  get "course/edit_one"
  get "course/delete_one"
  get "course/show_one"
  get "course/show_all"
  get "home/index"

  match '/browse_course', to:'course#browse', via:'get'
  match '/get_courses', to:'course#show_all', via:'get'
  match '/course', to:'course#show_one', via:'get'
  match '/add_course', to:'course#add', via:'get'
  match '/submit_course', to:'course#add_one', via:'post'
  # This line mounts Forem's routes at /forums by default.
  # This means, any requests to the /forums URL of your application will go to Forem::ForumsController#index.
  # If you would like to change where this extension is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Forem relies on it being the default of "forem"
  mount Forem::Engine, :at => '/forums'

  devise_for :users
  get "home/index"
  root :to => "home#index"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
