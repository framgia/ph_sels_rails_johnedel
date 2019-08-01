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
following = users[2..10]
followers = users[3..15]
following.each { |followed| user1.follow(followed) }
followers.each { |follower| follower.follow(user1) }

25.times do |n|
  title  = Faker::Lorem.word
  des =  Faker::Lorem.word

  Category.create!(title:  title,
                  description: des)
end


20.times do |n|
  title = Faker::Name.unique.name
  description =  "Lorem Epsum"
  Category.create!(title: title,description: description)

  10.times do
    content = Faker::Lorem.word
    word = Category.all.sample.words.build content: content
    word.choices = [
      Choice.new(content: content, correct: true),
      Choice.new(content: Faker::Music.instrument, correct: false),
      Choice.new(content: Faker::Music.chord, correct: false)
    ].shuffle
    word.save(validate: false)
  end
end

