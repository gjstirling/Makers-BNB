require 'pg'
require 'sinatra/base'
require 'sinatra/contrib'
require './db/init_db_conn.rb'
require 'sinatra/activerecord'
require './lib/user.rb'
require './lib/create.rb'




class BnB < Sinatra::Base


  configure :development do
    register Sinatra::Contrib
  end

  configure :test, :development do
    @db_connection = Connect.initiate(ENV["DB_IN_USE"])
    CreateTables.if_not_exists(@db_connection)
  end

  enable :sessions

  get '/listings' do
    @arr = [ [session[:name], session[:description], session[:price]] ] # Represents Space instance
    erb :'bnb/listings'
  end

  get '/create' do
    (params['error'].nil?) ? (@error = '') : (@error = params['error'])
    erb :create
  end

  post '/create_exec' do
    params.each do |key, value|
       params[key] = value.to_i if (value.to_i.is_a?(Integer) && (key == "price" || key == "capacity"))
    end
    params["user_id"] = 1
    Create.check_params?(params)
    redirect('/create?error=Something went wrong..') unless Create.check_params?(params)
    Create.add_space(params)
    redirect('/') # success
  end

  get '/' do
    db_connection = Connect.initiate(ENV["DB_IN_USE"])
    @spaces = db_connection.exec("SELECT * FROM spaces").to_a
    erb :index
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