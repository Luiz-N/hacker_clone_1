class Post < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :author, class_name: "User"
  has_many :comments
  has_many :commentors, through: :comments, source: :author
  # go to users table, and look up author field
end
