get '/buzzwords' do
  @buzz_words = all_buzzwords
  erb :index
end

get '/buzzwords/new' do
  erb :new
end

post '/buzzwords' do
  create_buzzword(params[:word], params[:description])
  redirect "/buzzwords"
end

get '/buzzwords/:id' do
  @buzz_word = find_one_buzzword(params[:id])
  erb :show
end

get '/my_buzzwords' do
  @buzz_words = all_buzzwords_by_user_id(1)
  erb :my_buzzwords
end