require 'pg'
require 'sinatra/base'
require 'sinatra/contrib'
require './db/init_db_conn.rb'
require 'sinatra/activerecord'
require './lib/user.rb'
require './lib/create_space.rb'
require './lib/create_booking.rb'




class BnB < Sinatra::Base


  configure :development do
    register Sinatra::Contrib
  end

  configure :test, :development do
    @db_connection = Connect.initiate(ENV["DB_IN_USE"])
    CreateTables.if_not_exists(@db_connection)
  end

  enable :sessions

  get '/create_space' do
    @signed_in = session[:signed_in]
    (params['error'].nil?) ? (@error = '') : (@error = params['error'])
    erb :create_space
  end

  post '/create_exec' do
    params.each do |key, value|
       params[key] = value.to_i if (value.to_i.is_a?(Integer) && (key == "price" || key == "capacity"))
    end
    params["user_id"] = 1
    CreateSpace.check_params?(params)
    redirect('/create_space?error=Something went wrong..') unless CreateSpace.check_params?(params)
    CreateSpace.add_space(params)
    redirect('/') # success
  end

  get '/' do
    session[:signed_in] = false if session[:signed_in].nil?
    @signed_in = session[:signed_in]
    db_connection = Connect.initiate(ENV["DB_IN_USE"])
    @spaces = db_connection.exec("SELECT * FROM spaces ORDER BY id DESC").to_a
    erb :index
  end

  get '/signin' do
    erb :signin
  end

  post '/signin_exec' do
    session[:username] = params[:username].clean_key
    session[:signed_in] = false
    user = User.get(params[:username].to_sym, params[:password].to_sym)
    session[:signed_in] = true unless user.nil?
    # params["user_id"] = user[0][:id]
    redirect('/') if session[:signed_in] == true
    redirect('/signin?error=User and password do not match')
  end

  get '/signout' do
    session[:signed_in] = false
    redirect('/')
  end

  get '/create_user' do
    erb :create_user
  end

  post '/create_user_exec' do
    session[:username] = params[:username].clean_key
    User.add(params).nil? ? (session[:registered_user] = false) : (session[:registered_user] = true)
    session[:signed_in] = true if session[:registered_user] == true
    redirect('/') if session[:registered_user] == true
    redirect('/create_user?error=Something went wrong')
  end

  get '/create_booking_exec' do
    params.each do |key, value|
       params[key] = value.to_i if (value.to_i.is_a?(Integer) && (key == "price" || key == "capacity"))
    end
    @signed_in = session[:signed_in]
    params["user_id"] = session["user_id"]
    params["space_id"] = session["space_id"]
    params["start_date"] = session['start_date']
    params["end_date"] = session['end_date']
    CreateSpace.check_params?(params)
    redirect('/create_space?error=Something went wrong..') unless CreateSpace.check_params?(params)
    CreateSpace.add_booking(params)
    redirect('/') # success
  end

  get '/create_booking' do
    @signed_in = session[:signed_in]
    (params['error'].nil?) ? (@error = '') : (@error = params['error'])
    @space = CreateBooking.get_space(params["space_id"])
    session["space_id"] = params["space_id"]
    session["user_id"] = params["user_id"]
    session['space_price'] = @space["price"]
    session['start_date'] = Time.now
    session['end_date'] = Time.now.to_i + (100)
    erb :create_booking
  end

  run! if app_file == $0
end