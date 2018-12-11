Rails.application.routes.draw do

  ActiveAdmin.routes(self)

  #get 'pages/login'
  devise_for :students, :controllers => { :omniauth_callbacks => "callbacks" }
  devise_for :tutors

  #API
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :lessons, only: [ :index, :show ]
      resources :tutors, only: [ :index, :show ]
      resources :students, only: [ :index, :show ]
    end
  end

  resources :tutors do
    resources :reviews, only: [:new, :create]
    resources :documents
    resources :identities
  end

  resources :students do
    resources :reviews, only: [:new, :create]
  end

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

  # Tutor#Mask --> Prototyping purpose
  get '/mask' => 'pages#mask'
  # Tutor#Documents --> Prototyping purpose
  get '/documents' => 'pages#documents'

# root to: "lessons#index"
# root to: "pages#credential"

  unauthenticated do
     root to: "pages#credential"
  end

  authenticated do
    root to: "lessons#index"
  end

end
