Rails.application.routes.draw do

  get 'pages/login'
  devise_for :students
  devise_for :tutors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "lessons#index"

  resources :tutors do
    resources :reviews, only: [:new, :create]
  end

  resources :students
  resources :lessons

  #
  get '/signup' => 'pages#signup'
end
