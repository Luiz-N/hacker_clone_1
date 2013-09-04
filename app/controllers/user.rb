
# GET ####################
enable :sessions


#Grab new user form
get '/user/new' do
  erb :new_user
end

#Grab user login form
get '/user/login' do
  erb :login
end


get '/user/logout' do 
  session.clear
  redirect "/"
end

#Grab user specific profile page
get '/user/:id' do
  p "This is the problem"
end

#Show list of all user's posts
get '/:username/posts' do 
end

#Show list of all posts that user commented on
get '/:username/comments' do 
end






# POST ####################

#Create a new user, if email doesnt exist yet
post '/user/new' do
  # @user = User.find_by_email(params[:user]['email'])
  
  # # If they don't exist, create new user
  # if @user.nil? 
  #   @user = User.create(params[:user])
  # end

  # redirect "/"
end

post '/user/login' do
  @user = User.find_by_email(params[:email])
  if @user 
    if @user.password == params[:password]
      session[:user_id] = @user.id
      redirect "/"
    else
      @error = "Incorrent email and/or password"
      erb :login #email or pw incorrect
      # redirect "/user/login"
    end
  else
      @error = "Incorrent email and/or password"
      erb :login #error no user message
  end
end

# post '/logout' do
#   # session.clear
#   redirect "/"
# end

