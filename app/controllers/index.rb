# GET ####################

get '/' do
  @user = current_user
  @posts = Post.order('created_at DESC').limit(25)
  erb :index
end


# POST ####################




