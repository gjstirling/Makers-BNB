require 'pg'
require 'sinatra/base'
require 'sinatra/contrib'

class BnB < Sinatra::Base

  get '/' do
    'Hiiiiiiiiii'
  end

  run! if app_file == $0
end