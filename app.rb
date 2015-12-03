require 'sinatra/base'

class App < Sinatra::Base
  register Sinatra::CrossOrigin

  enable :cross_origin

  set :cross_origin, true
  set :allow_origin, :any
  set :allow_methods, [:get, :post, :options]
  set :max_age, '1728000'
  set :expose_headers, ['Content-Type']

  options '*' do
    response.headers['Allow'] = 'HEAD,GET,PUT,POST,DELETE,OPTIONS'
    h = 'X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept'
    response.headers['Access-Control-Allow-Headers'] = h

    200
  end

  get '/' do
    "Hello World"
  end
end
