require 'sinatra'
require 'sinatra/reloader'
require 'pg'

enable :sessions

require_relative 'helpers/helpers'
require_relative 'models/buzzword'
require_relative 'models/user'

require_relative 'controllers/home_controller'
require_relative 'controllers/buzzword_controller'
require_relative 'controllers/session_controller'







