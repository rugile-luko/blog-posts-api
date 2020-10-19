Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :posts, only: %i[index show] do
        resources :comments, only: %i[index show create update destroy]
      end
      resources :users, only: %i[index create]
      get 'profile', action: :show, controller: :users
      post '/users/login'
      resources :users do
        resources :posts
      end
    end
  end
end
