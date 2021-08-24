require 'pg'
require 'sinatra/base'
require 'sinatra/contrib'

class BnB < Sinatra::Base

  get '/' do
    'Hiiiiiiiiiiiii'
  end

  run! if app_file == $0
end