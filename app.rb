require 'pg'
require 'sinatra/base'
require 'sinatra/contrib'
require './db/init_db_conn.rb'

class BnB < Sinatra::Base
  configure :development do
    register Sinatra::Contrib
  end

  configure :test, :development do
    @db_connection = Connect.initiate(ENV["DB_IN_USE"])
    CreateTables.if_not_exists(@db_connection)
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