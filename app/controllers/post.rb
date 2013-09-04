# GET ####################

#Grab new post form
get '/post/new' do
  erb :new_post
end

#Find and go to specific post page
get '/post/:id' do
  @user = current_user
  @post = Post.find(params[:id])
  erb :post_page
end



# POST ####################

#Create new post 
post '/posts' do 
  @post = Post.new(params[:post])
  @post.author_id = session[:user_id]
  @post.save

  redirect "/"
end
