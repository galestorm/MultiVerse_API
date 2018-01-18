Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/poems', to: 'poems#index'

  get '/poems/:id', to: 'poems#show'

  get '/weather', to: 'wrappers#weather'

  post '/users', to: 'users#login'

  post '/saved_poems', to: 'saved_poems#create'

  get '/saved_poems', to: 'saved_poems#index'

  post '/experiences', to: 'experiences#create'

  get '/experiences', to: 'experiences#index'
end
