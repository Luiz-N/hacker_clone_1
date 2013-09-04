require 'faker'

50.times do 
  Post.create!(
    :title => Faker::Company.catch_phrase,
    :url => Faker::Internet.url,
    :content => Faker::Lorem.paragraph(sentence_count = 3),
    :author_id => rand(1..10)
  )
end

10.times do 
  User.create!(
    :username => Faker::Internet.user_name,
    :email => Faker::Internet.email
  )
end


100.times do
  Comment.create!(
    :content => Faker::Lorem.paragraph(sentence_count = 2),
    :author_id => rand(1..10),
    :post_id =>   rand(45..50)
    )
end
