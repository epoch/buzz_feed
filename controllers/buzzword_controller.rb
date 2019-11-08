get '/buzzwords' do
  @buzzwords = all_buzzwords
  erb :index
end

get '/buzzwords/new' do
  erb :new
end

post '/buzzwords' do
  redirect "/login" unless logged_in?
  create_buzzword(params[:word], params[:description], current_user["id"])
  redirect "/buzzwords"
end

get '/buzzwords/:id/edit' do
  @buzzword = find_one_buzzword(params[:id])
  erb :edit
end

get '/buzzwords/:id' do
  @buzzword = find_one_buzzword(params[:id])
  erb :show
end

get '/my_buzzwords' do
  @buzzwords = all_buzzwords_by_user_id(1)
  erb :my_buzzwords
end