#!/usr/bin/env ruby
require 'pg'
require 'sinatra/base'
require 'sinatra/contrib'
require './db/init_db_conn.rb'

class BnB < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end
  
  enable :sessions
    
  configure :test, :development do
    @db_connection = Connect.initiate(ENV["DB_IN_USE"])
    CreateTables.if_not_exists(@db_connection)
  end

  get '/' do
    'Hiiiiiiiiiiiii'
  end

  run! if app_file == $0
end