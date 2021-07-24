Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  get  "home/about"  => "homes#show"
  resources :users, only: [:index,:show, :edit,:update]
  # resource :relationships, only: [:create, :destroy]
  # get 'followings/:id' => 'relationships#followings', as: 'followings'
  # get 'followers/:id' => 'relationships#followers', as: 'followers'
  # get '/search', to: 'searchs#search'

  resources :rooms do
    resource :likes, only: [:create,:destroy]
    resources :comments, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
