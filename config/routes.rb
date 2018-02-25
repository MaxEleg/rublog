Rails.application.routes.draw do


  #resources :main_p

  get "articles/best" => "articles#best"

  devise_for :users
  resources :users
  resources :articles

  post 'comment', to: 'comments#new'

  resources :articles do
    member do
      put "like" => "articles#upvote"
      put "unlike" => "articles#downvote"
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
