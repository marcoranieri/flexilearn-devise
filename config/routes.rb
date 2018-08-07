Rails.application.routes.draw do

  get 'pages/login'
  devise_for :students
  devise_for :tutors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :tutors
  resources :students
  resources :lessons
  root to: "lessons#index"

  get '/login' => 'pages#login'
end
