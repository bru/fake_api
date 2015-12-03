require 'sinatra/base'

class App < Sinatra::Base
  register Sinatra::CrossOrigin

  get '/' do
    "Hello World"
  end
end
