get '/buzzwords' do
  @buzz_words = all_buzzwords
  erb :index
end

get '/buzzwords/:id' do
  @buzz_word = find_one_buzzword(params[:id])
  erb :show
end