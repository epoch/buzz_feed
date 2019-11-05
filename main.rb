require 'sinatra'
require 'sinatra/reloader'
require 'pg'

def run_sql(sql)
  conn = PG.connect(ENV['DATABASE_URL'] || { dbname: "buzz_feed" })
  records = conn.exec(sql)
  conn.close
  return records
end

def all_buzzwords()
  return run_sql("SELECT * FROM buzzwords;")
end

def find_one_buzzword(id)
  return run_sql("SELECT * FROM buzzwords where id = #{id};").first
end

def find_buzzwords_by_user_id(id)
  return run_sql("SELECT * FROM buzzwords where user_id = #{id};")
end

get '/' do
  erb :home
end

get '/my_buzzwords' do
  @buzz_words = find_buzzwords_by_user_id(1)
  erb :my_buzzwords
end

require_relative 'controllers/buzzword_controller'
require_relative 'controllers/login_controller'







