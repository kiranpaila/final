Rails.application.routes.draw do

  get 'sessions/new'

  resources :eventcoordinators
  resources :registrations
  resources :events
  resources :expenses
  resources :funds
  resources :users
  resources :news
  get 'example/index'

  #resources :demos

  resources :feedbacks

  get 'about_us/index'

  get 'welcome/index'

  root 'welcome#index'

  # get 'users/new'

  get 'admin/adduser' =>'admin#adduser'
  post 'admin/adduser' =>'admin#adduser'


  get 'admin/logout'=>'admin#logout'
  get 'admin/edituser'=>'admin#edituser'
  get 'admin/deleteuser'=>'admin#deleteuser'

  get 'admin/events'=>'admin#events'

  get 'admin/registration' =>'admin#registration'
  post 'admin/registration' =>'admin#registration'

  get 'admin/news' =>'admin#news'
  post 'admin/news' =>'admin#news'

  get 'admin/feedback' =>'admin#feedback'
  post 'admin/feedback' =>'admin#feedback'

  get 'admin/funds' =>'admin#funds'
  post 'admin/funds' =>'admin#funds'


  get 'admin/edituserdetails'=>'admin#edituserdetails'
  post 'admin/edituserdetails'=>'admin#edituserdetails'

  get 'admin/sponsorships'=>'admin#sponsorships'
  post 'admin/sponsorships'=>'admin#sponsorships'

  get 'admin/expenditures'=>'admin#expenditures'
  post 'admin/expenditures'=>'admin#expenditures'

  get 'admin/registrationfee'=>'admin#registration'
  post 'admin/registrationfee'=>'admin#registration'




  get 'admin/users' =>'admin#users'
  get 'admin/home'
  get 'admin/dashboard' => 'admin#dashboard'

  root 'sessions#new'

  # get  '/signin',  to: 'users#new'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
