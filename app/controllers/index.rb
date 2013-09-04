# GET ####################

get '/' do
  @posts = Post.order('created_at DESC').limit(25)
  erb :index
end


# POST ####################




