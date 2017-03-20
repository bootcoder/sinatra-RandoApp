get '/users' do
  @users = User.all
  erb :'users/index'
end

get '/users/new' do
  return erb :'users/new', layout: false if request.xhr?
  erb :'users/new'
end

post '/users' do
  @user = User.new(params[:user])

  if @user.save
    session[:id] = @user.id
    redirect '/users'
  else
    @errors = @user.errors.full_messages
    # @errors = ["User didnt save, try again!"]
    erb :'users/new'
  end

end


get '/users/:id' do
  @user = User.find(params[:id])
  return erb :'users/_show', layout: false, locals: {user: @user} if request.xhr?
  erb :'users/show'
end


get '/users/:id/edit' do
  @user = User.find(params[:id])
  erb :'users/edit'
end

