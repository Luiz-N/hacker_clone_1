
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
  @user = current_user
  erb :profile
end

#Show list of all user's posts
get '/user/:id/posts' do
  @user = current_user
  @posts = Post.where(author_id: params[:id])
  erb :user_posts
end

#Show list of all posts that user commented on
get '/user/:id/comments' do 
  @user = current_user
  @comments = Comment.where(author_id: params[:id])
  erb :user_comments
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
  
  if User.find_by_email(params[:email])
    @login = User.find_by_email(params[:email])
    if @login.password == params[:password]
      session[:user_id] = @login.id
      redirect "/"
    else
      @error = "Incorrect email and/or password"
      erb :login #email or pw incorrect
      # redirect "/user/login"
    end
  else
      @error = "Incorrect email and/or password"
      erb :login #error no user message
  end
end

# post '/logout' do
#   # session.clear
#   redirect "/"
# end

