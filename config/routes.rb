Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  root to: 'links#index'

  devise_for :users
  
  resources :links do
    member do
      put "like",    to: "links#upvote"
      put "dislike", to: "links#downvote"
    end
    resources :comments
  end

  resources :comments
end
