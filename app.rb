require 'pg'
require 'sinatra/base'
require 'sinatra/contrib'

class BnB < Sinatra::Base
  configure :development do
    register Sinatra::Contrib
  end

  enable :sessions

  get '/bnb/listings' do
    @arr = [ [session[:name], session[:description], session[:price]] ] # Represents Space instance
    erb :'bnb/listings'
  end

  get '/bnb/create' do
    erb :'bnb/create'
  end

  post '/bnb/new_listing' do
    session[:name] = params[:name]
    session[:description] = params[:description]
    session[:price] = params[:price]
    redirect('/bnb/listings')
  end
  

  run! if app_file == $0
end