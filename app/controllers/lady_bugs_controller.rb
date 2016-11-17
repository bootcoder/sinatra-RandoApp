# get '/' do
#   redirect '/ladybugs'
#   # erb :index
# end

# LadyBug INDEX
get '/ladybugs' do
  @ladybugs = LadyBug.all
  erb :'ladybugs/index'
end

# LadyBug NEW
get '/ladybugs/new' do
  erb :'ladybugs/new'
end

# LadyBug SHOW
get '/ladybugs/:id' do
  @ladybug = LadyBug.find(params[:id])
  erb :'ladybugs/show'
end


# LadyBug EDIT
get '/ladybugs/:id/edit' do
  @ladybug = LadyBug.find(params[:id])
  erb :'ladybugs/edit'
end

# LadyBug CREATE
post '/ladybugs' do
  @ladybug = LadyBug.new(params[:ladybug])
  if @ladybug.save
    redirect '/ladybugs'
  else
    @errors = @ladybug.errors.full_messages
    @errors = ["You fucked up!"]
    erb :'ladybugs/new'
  end
end

# LadyBug UPDATE
put '/ladybugs/:id' do
  @ladybug = LadyBug.find(params[:id])
  @ladybug.update(params[:ladybug])
  redirect "/ladybugs/#{@ladybug.id}"
end

# LadyBug DELETE
delete '/ladybugs/:id' do
  @ladybug = LadyBug.find(params[:id])
  @ladybug.destroy
  redirect '/ladybugs'
end

