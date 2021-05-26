User.create!( name:  "Test User",
              email: "test@railstest.jp",
              password: "foobar"  )

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstest.jp"
  password = "password"
  User.create!( name: name,
                email: email,
                password:  password)
end

users = User.order(:created_at).take(20)
10.times do
  content = Faker::ChuckNorris.fact
  users.each  { |user|  user.microposts.create!(content:  content)}
end

10.times do
  notice_title = Faker::Lorem.sentence(word_count: 3)
  notice_body  = Faker::Lorem.sentences
  users.each {  |user| user.notices.create!(notice_title: notice_title,
                                            notice_body:  notice_body) }
end

users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

users.each { |users|  users }