# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
max = User.create(username: "Max", email: "maxsmouha@gmail.com", password: "12345", photo: "new.jpg", bio: "yuuuuup")
tony = User.create(username: "Tony", email: "tonyreiser@gmail.com", password: "12345", photo: "new.jpg", bio: "yuuuuup")

forum = Forum.create(name:"Fun Forum")

Post.create(title: "Welcome to my post", content: "It is what it is", user_id:tony.id, forum_id: forum.id)

ForumAdmin.create(forum_id: forum.id, user_id: tony.id)

ForumFollow.create(forum_id: forum.id, user_id: max.id)
