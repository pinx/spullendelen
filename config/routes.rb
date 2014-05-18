Spullendelen::Application.routes.draw do
  get "home/index"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  devise_for :members, controllers: {omniauth_callbacks: 'members/omniauth_callbacks'} #, :controllers => {:registrations => "registrations"}

  resources :members do
    resources :things
    resources :wishes
  end

  get 'member/things', to: 'things#my', as: 'my_things'
  get 'member/wishes', to: 'wishes#my', as: 'my_wishes'

  resources :wishes
  resources :circles
  resources :things
  resources :categories
end
