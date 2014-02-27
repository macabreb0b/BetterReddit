BetterReddit::Application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]
  resources :subs
  resources :links, only: [:new, :create, :edit, :update, :show]
end
