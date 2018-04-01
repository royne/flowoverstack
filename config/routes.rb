Rails.application.routes.draw do
  root 'questions#index'

  resources :questions, only: [:index, :show, :new, :create] do
    resources :answers, only: [:create]
    resources :comments, only: [:create]
    resource :vote_question, only: [:create, :destroy]
  end

  resources :answers, only: [:create] do
    post '/commentanswer', to: 'comments#create_answer'
  end

  devise_for :users
end
