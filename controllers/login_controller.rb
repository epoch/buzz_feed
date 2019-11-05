get '/login' do
  erb :login
end

post '/login' do
  # check record exist in the db
  user = find_user_by_email(params[:email])
  # check password is valid for that record
  if BCrypt::Password.new( user["password_digest"] ) == params[:password]
    # write down id of login user (we usually say create a session for the user)
    session[:user_id] = user["id"] # single source of truth
    # redirect to secret location, just home page for now
    redirect "/" # its up to you prob user dashboard or profile page
  else
    return "no frynuts"
  end
end

delete '/logout' do
  session[:user_id] = nil
  redirect "/login"
end