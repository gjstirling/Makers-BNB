require 'pg'
require 'sinatra/base'
require 'sinatra/contrib'
require './db/init_db_conn.rb'
require 'sinatra/activerecord'


class User < ActiveRecord::Base
end

class BnB < Sinatra::Base
  before do
    content_type :json
  end

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

  post '/bnb/create_user' do
    @user = user.create(params[:name])
  end

  post
  
  get '/usersx/?' do # just for testing
    @users = User.all
    @users.to_json
  end

  run! if app_file == $0
end