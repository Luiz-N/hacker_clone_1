# GET ####################

#Grab new post form
get '/post/new' do
  erb :new_post
end

#Find and go to specific post page
get '/post/:id' do
  @post = Post.find(params[:id])
  erb :post_page
end



# POST ####################

#Create new post 
post '/posts' do 
  @post = Post.create(params[:post])
  # @post.author_id = @user.id #come back and replace with session[:user_id]
  redirect "/"
end
