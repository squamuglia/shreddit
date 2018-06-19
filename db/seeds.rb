# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
def to_slug(string)
  string.parameterize.truncate(80, omission: '')
end

max = User.create(username: "Max", email: "maxsmouha@gmail.com", password: "12345", photo: "new.jpg", bio: "yuuuuup")
tony = User.create(username: "Tony", email: "tonyreiser@gmail.com", password: "12345", photo: "new.jpg", bio: "yuuuuup")
chef = User.create(username: "Chef Boyardee", email: "chefb@gmail.com", password: "12345", photo: "new.jpg", bio: "the best ravioli around")


forum = Forum.create(name:"Fun Forum", slug: to_slug("Fun Forum"))
forum2 = Forum.create(name:"Sales", slug: to_slug("Sales"))
forum3 = Forum.create(name:"Tbone's Boneyard", slug: to_slug("Tbone's Boneyard"))
forum4 = Forum.create(name:"Friends", slug: to_slug("Friends"))


p1 = Post.create(title: "Welcome to my post", content: "It is what it is", user_id:max.id, forum_id: forum.id)

Comment.create(user_id: tony.id, post_id: p1.id, content: "This post is bullshit")
Comment.create(user_id: max.id, post_id: p1.id, content: "Lol")

p2 = Post.create(title: "Selling used lawnmower", content: "gimme 500 for it", user_id:tony.id, forum_id: forum2.id)
Comment.create(user_id: chef.id, post_id: p2.id, content: "I need a new lawmower")
Comment.create(user_id: tony.id, post_id: p2.id, content: "DM me")

p3 = Post.create(title: "Selling used hammer", content: "gimme 500 for it", user_id:tony.id, forum_id: forum2.id)
Comment.create(user_id: chef.id, post_id: p3.id, content: "I need a new lawmower")
Comment.create(user_id: tony.id, post_id: p3.id, content: "DM me")

p4 = Post.create(title: "Bones in this yard", content: "gimme 500 for it", user_id:max.id, forum_id: forum3.id)
Comment.create(user_id: chef.id, post_id: p4.id, content: "I need a new lawmower")
Comment.create(user_id: tony.id, post_id: p4.id, content: "DM me")

p5 = Post.create(title: "Friends indeed", content: "gimme 500 for it", user_id:max.id, forum_id: forum4.id)
Comment.create(user_id: chef.id, post_id: p5.id, content: "I need a new lawmower")
Comment.create(user_id: tony.id, post_id: p5.id, content: "DM me")
p1.update(slug: to_slug(p1.title))
p2.update(slug: to_slug(p2.title))
p3.update(slug: to_slug(p3.title))
p4.update(slug: to_slug(p4.title))
p5.update(slug: to_slug(p5.title))



ForumAdmin.create(forum_id: forum.id, user_id: tony.id)
ForumFollow.create(forum_id: forum.id, user_id: max.id)
