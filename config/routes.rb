Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  resources :users, only: %i[index show edit update]
  resources :rooms do
    resource :likes, only: %i[create destroy]
    resources :comments, only: %i[create destroy]
  end
end
