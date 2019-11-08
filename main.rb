require 'sinatra'
require 'pg'

ROOT = File.expand_path(__dir__)

if settings.development?
  require 'sinatra/reloader'
  also_reload File.join(ROOT, "helpers/*")
  also_reload File.join(ROOT, "models/*")
  also_reload File.join(ROOT, "controllers/*")
end

enable :sessions

require_relative 'helpers/helpers'
require_relative 'models/buzzword'
require_relative 'models/user'

require_relative 'controllers/home_controller'
require_relative 'controllers/buzzword_controller'
require_relative 'controllers/session_controller'







