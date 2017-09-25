Rails.application.routes.draw do

  resources :eventcoordinators
  resources :registrations
  resources :events
  resources :expenses
  resources :funds
  resources :users
  resources :news

  resources :feedbacks

  get 'about_us/index'

  get 'welcome/index'

  root 'welcome#index'


  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
