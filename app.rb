require 'pg'
require 'sinatra/base'
require 'sinatra/contrib'

class BnB < Sinatra::Base
  configure :development do
    register Sinatra::Contrib
  end

  get '/bnb/listings' do
    erb :'bnb/listings'
  end

  get 'bnb/create' do
    
  end
  

  run! if app_file == $0
end