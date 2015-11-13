Rails.application.routes.draw do
  resources :lists
  #  User Authentation
  resources :users


  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'


  match '/contacts',     to: 'contacts#new',             via: 'get'
  resources "contacts", only: [:new, :create]



  match '/sms/:id' => 'lists#sms', as: :sms, via: :put

  root 'welcome#index'
end
