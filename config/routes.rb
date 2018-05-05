Rails.application.routes.draw do
  get 'pages/home'
  post '/graphql', to: 'graphql#execute'
  root to: 'pages#home'
end

