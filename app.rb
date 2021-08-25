require 'pg'
require 'sinatra/base'
require 'sinatra/contrib'
ENV['DATABASE_URL'] = 'july21_makersbnb_creative_team'
$DATABASE_URL = 'july21_makersbnb_creative_team'
require "sinatra/activerecord"
require './db/init_db_conn.rb'
set :database, {adapter: "sqlite3", database: ENV["DB_IN_USE"]}
# or set :database_file, "path/to/database.yml"

class BnB < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  configure :development do
    register Sinatra::Contrib
  end

  configure :test, :development do
    # @db_connection = Connect.initiate(ENV["DB_IN_USE"])
    # CreateTables.if_not_exists(@db_connection)
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