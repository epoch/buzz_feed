
get '/buzzwords' do
  @buzzwords = all_buzzwords
  erb :"/buzzword/index"
end

get '/buzzwords/new' do
  erb :"/buzzword/new"
end

post '/buzzwords' do
  redirect "/login" unless logged_in?
  create_buzzword(params[:word], params[:description], current_user["id"])
  redirect "/buzzwords"
end

get '/buzzwords/:id/edit' do
  @buzzword = find_one_buzzword(params[:id])
  erb :"/buzzword/edit"
end

get '/buzzwords/:id' do
  @buzzword = find_one_buzzword(params[:id])
  erb :"/buzzword/show"
end

get '/my_buzzwords' do
  @buzzwords = all_buzzwords_by_user_id(1)
  erb :"/buzzword/my_buzzwords"
end