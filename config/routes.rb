Rails.application.routes.draw do
  root 'pages#home'
  resources :articles, only: [:show, :index]
  # get '/articles' => 'articles#index'
  get '/articles/new' => 'articles#new', as: 'new_article'
  post '/articles' => 'articles#create', as: 'create_article'
end
