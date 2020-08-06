Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :city
  resources :gossips do 
    resources :comments
  end

  get 'authors/:author_id', to: 'authors#show'
  get '/team', to: 'static_pages#team'
  get '/contact', to: 'static_pages#contact'
  get '/welcome/:first_name', to: 'static_pages#welcome'
  get '/', to: 'static_pages#index'
end
