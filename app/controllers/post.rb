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

get '/post/:id/edit' do
  @post = Post.find(params[:id])

  if @post.author_id == session[:user_id]
    erb :edit_post
  else
    redirect "/post/#{params[:id]}"
  end

end


# POST ####################

#Create new post 
post '/posts' do 
  @post = Post.new(params[:post])
  @post.author_id = session[:user_id]
  @post.save

  redirect "/"
end

post '/post/:id' do
  @post = Post.find(params[:id])
  @post.update_attributes(params[:post])
  redirect "/"
end

post '/post/:id/delete' do
  @post = Post.find(params[:id])
  @post.destroy
  redirect "/"
end
