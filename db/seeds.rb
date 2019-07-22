User.create!(name:  "Admin User",
             email: "example@railstutorial.org",
             password:              "password",
             password_confirmation: "password",
             admin: true)

User.create!(name:  "Johnedel Mapa",
             email: "johnedel.mapa@sun-asterisk.com",
             password:              "password",
             password_confirmation: "password",
             admin: true)

49.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

users = User.all
user1  = users.find_by(id: 2)
following = users[2..50]
followers = users[3..40]
following.each { |followed| user1.follow(followed) }
followers.each { |follower| follower.follow(user1) }

49.times do |n|
  title  = Faker::Book.title
  des = "Lorem Ipsum"

  Category.create!(title:  title,
                  description: des)
end