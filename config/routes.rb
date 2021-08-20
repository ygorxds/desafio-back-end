Rails.application.routes.draw do

  get '/cnabs', to: 'cnab#index'
  post '/cnabs/importar', to: 'cnab#importar'
  get '/cnabs/t', to: 'cnab#t'

end
