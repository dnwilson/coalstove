Coalstove::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'pages#home'
  
  devise_for :users, :path =>'', :path_names => { :sign_in => 'login', :sign_out => 'logout', 
                                                  :sign_up => 'register'}

  devise_scope :user do
    get "login",    :to => "users/sessions#new"
    get "logout",   :to => "users/sessions#destroy"
    get "register", :to => "users/registrations#new"
    get "delete",   :to => "users/registrations#destroy"
    get "settings", :to => "users/registrations#edit"
  end 
  
  resources :items
  resources :transactions
  
  get '/about', to: 'pages#about'
  get '/menu', to: 'pages#menu'
  get '/contact', to: 'pages#contact'
  
  get 'categories/:category', to: 'items#index', as: :category
end