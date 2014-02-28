BetterReddit::Application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]
  resources :subs
  resources :links do
    member do
      post :upvote, to: "votes#upvote_link"
      post :downvote, to: "votes#downvote_link"
      post :unvote, to: "votes#unvote_link"
    end
    resources :comments, only: [:create]
  end
  resources :comments, only: [:destroy] do
    member do
      post :upvote, to: "votes#upvote_comment"
      post :downvote, to: "votes#downvote_comment"
    end
  end
end
