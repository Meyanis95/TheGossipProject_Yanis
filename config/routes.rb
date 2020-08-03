Rails.application.routes.draw do
  get 'author/:author_id', to: 'author#display_author'
  get '/team', to: 'static_pages#team'
  get '/contact', to: 'static_pages#contact'
  get '/welcome/:first_name', to: 'static_pages#welcome'
  get '/', to: 'static_pages#first_page'
  get 'gossip/:id', to: 'static_pages#show_gossip'
end
