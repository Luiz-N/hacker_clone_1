# GET ####################






# POST ####################

post '/comment' do


  comment = Comment.new(content: params[:comment], author_id: session[:user_id],  )


end
