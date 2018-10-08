Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  #get 'pages/login'
  devise_for :students, :controllers => { :omniauth_callbacks => "callbacks" }
  devise_for :tutors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :tutors do
    resources :reviews, only: [:new, :create]
    resources :documents
    resources :identities
  end

  resources :students
  resources :lessons
  resources :categories

  # Stripe
  resources :orders, only: [:index, :show, :create] do
    resources :payments, only: [:new, :create]
  end

  # SignUp for both Student/Tutor
  get '/signup' => 'pages#signup'
  # LogIn for both Student/Tutor
  get '/login' => 'pages#login'
  # Index.ALL
  get '/all' => 'pages#all'

  root to: "pages#all"
end
