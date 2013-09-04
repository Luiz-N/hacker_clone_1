class Post < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  has_many :comments
  has_many :commentors, through: :comments, source: :author
  # go to users table, and look up author field'
  after_save :set_url,  if: :url_nil?

  validates :title, presence: true

  def set_url
    puts "Does this work?"
    self.update_attributes(url: "/post/#{self.id}")
  end

  def url_nil?
    self.url.nil?
  end

end
