require 'sinatra'
require 'sinatra/reloader'
require 'pg'

require_relative 'models/buzzword'

get '/' do
  erb :home
end

require_relative 'controllers/buzzword_controller'
require_relative 'controllers/login_controller'







