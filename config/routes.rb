Rails.application.routes.draw do
  root to: "languages#index"
  get '/categories', to: 'categories#index'
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
  post '/answers/create.:format', to: 'answers#create', as: :create_answer, constraints: {:format => /json/}

  get '/login', to: 'sessions#login', as: 'login'
  get '/logout', to: 'sessions#logout', as: 'logout'
  get '/sign-up', to: 'users#new', as: 'sign_up'
  get '/profile', to: 'users#profile', as: 'profile'
  post '/attempt_login', to: 'sessions#attempt_login'
  get '/get_answer/', to: 'questions#get_answer', as: :get_answer
  get '/get_answers/', to: 'questions#get_answers', as: :get_answers
  resources :users
  resources :answers
  resources :categories, only: [:index]
  resources :questions, only: [:index, :show]


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
