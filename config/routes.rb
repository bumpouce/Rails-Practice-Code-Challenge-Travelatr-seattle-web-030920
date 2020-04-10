Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/posts/:id/like', to: 'posts#like', :as => :like


  resources :destinations
  resources :bloggers
  resources :posts
end
