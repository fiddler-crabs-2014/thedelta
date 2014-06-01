Rails.application.routes.draw do
  root to: "languages#index"
  get '/categories', to: 'categories#index'

  post '/answers/create.:format', to: 'answers#create', as: :create_answer, constraints: {:format => /json/}

  get '/login', to: 'sessions#login', as: 'login'
  get '/logout', to: 'sessions#logout', as: 'logout'
  get '/sign-up', to: 'users#new', as: 'sign_up'
  get '/profile', to: 'users#profile', as: 'profile'
  post '/attempt_login', to: 'sessions#attempt_login'
  get '/get_answer/', to: 'questions#get_answer', as: :get_answer
  get '/get_answers/', to: 'questions#get_answers', as: :get_answers
  post 'vote-up', to: 'votes#upvote', as: :vote_up
  post 'vote-down', to: 'votes#downvote', as: :vote_down
  post 'vote', to: 'votes#record', as: :vote_record
  get '/team', to: 'users#team', as: 'team'
  resources :users
  resources :answers
  resources :categories, only: [:index]
  resources :questions, only: [:index, :show]

  namespace :admin do
    resources :answers
    resources :users
  end

  
end
