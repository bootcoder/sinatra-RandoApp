#LOGIN FORM
get '/sessions' do
  erb :'sessions/new'
end

#LOGIN ACTION
post '/sessions' do
  p "*" * 90
  p params
  @user = User.find_by(email: params[:email])
  if @user && @user.password == params[:password]
    session[:id] = @user.id
    redirect '/users'
  else
    @errors = ['Username or Password Incorrect!']
    erb :'sessions/new'
  end
end

# LOGOUT ACTION
delete '/sessions' do
  session[:id] = nil
  redirect '/'
end
