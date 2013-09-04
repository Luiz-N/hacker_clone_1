# GET ####################






# POST ####################

post '/comment' do
  @comment = Comment.new(
    content: params[:comment], 
    author_id: session[:user_id], 
    post_id: params[:post_id] 
  )
  @comment.save
  redirect "/post/#{params[:post_id]}"

end
