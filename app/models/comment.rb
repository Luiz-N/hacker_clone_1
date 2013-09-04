class Comment < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  belongs_to :post


  def get_username
    User.find(self.author_id).username
  end

end
