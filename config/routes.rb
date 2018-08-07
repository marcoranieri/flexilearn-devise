Rails.application.routes.draw do

  devise_for :students
  devise_for :tutors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :tutors
  resources :students
  resources :lessons
  root to: "students#index"
end
