Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/poems', to: 'poems#index'

  get '/poems/:id', to: 'poems#show'
end
