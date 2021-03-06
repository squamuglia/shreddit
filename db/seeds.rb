# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.all.destroy_all
Forum.all.destroy_all
Post.all.destroy_all
Comment.all.destroy_all
ForumAdmin.all.destroy_all
Like.all.destroy_all

def to_slug(string)
  string.parameterize.truncate(80, omission: '')
end


max = User.create(username: "Max", email: "maxsmouha@gmail.com", password: "12345", avatar: "new.jpg", bio: "yuuuuup")
tony = User.create(username: "Tony", email: "tonyreiser@gmail.com", password: "12345", avatar: "new.jpg", bio: "yuuuuup")
chef = User.create(username: "Chef Boyardee", email: "chefb@gmail.com", password: "12345", avatar: "new.jpg", bio: "the best ravioli around")

max.update(slug: to_slug(max.username))
tony.update(slug: to_slug(tony.username))
chef.update(slug: to_slug(chef.username))



forum = Forum.create(name:"Fun Forum", description:"It's for fun", slug: to_slug("Fun Forum"), user_id: 1)
forum2 = Forum.create(name:"Sales", description:"It's for sales", slug: to_slug("Sales"), user_id: 2)
forum3 = Forum.create(name:"Tbone's Boneyard", description:"It's for bones", slug: to_slug("Tbone's Boneyard"), user_id: 2)
forum4 = Forum.create(name:"Friends", description:"It's for friends", slug: to_slug("Friends"), user_id: 2)
forum5 = Forum.create(name:"Max's Forum, A Space for Max, to be Max", description:"It's for MAX", slug: to_slug("max-s-forum"), user_id: 1)


p1 = Post.create(title: "Welcome to my post", content: "It is what it is", user_id:max.id, forum_id: forum.id)

Comment.create(user_id: tony.id, post_id: p1.id, content: "Hello!")
Comment.create(user_id: max.id, post_id: p1.id, content: "Lol")
Comment.create(user_id: max.id, post_id: p1.id, content: "Lorem ipsum dolor sit amet, at nonumes deleniti democritum eam. Sit te assum corrumpit. Eligendi postulant aliquando nec in, no nam movet omnium. Reque molestie electram id mei, ad viris decore omnium vis. Case abhorreant at cum, id tale legimus ius, id senserit ullamcorper per. Ex rebum putant epicuri duo, cum ne principes moderatius.
")


p2 = Post.create(title: "Selling used lawnmower", content: "gimme 500 for it", user_id:tony.id, forum_id: forum2.id)
Comment.create(user_id: chef.id, post_id: p2.id, content: "I need a new lawmower")
Comment.create(user_id: tony.id, post_id: p2.id, content: "DM me")

p3 = Post.create(title: "Selling used hammer", content: "gimme 500 for it", user_id:tony.id, forum_id: forum2.id)
Comment.create(user_id: chef.id, post_id: p3.id, content: "I need a new lawmower")
Comment.create(user_id: tony.id, post_id: p3.id, content: "DM me")

p4 = Post.create(title: "Bones in this yard", content: "gimme 500 for it", user_id:max.id, forum_id: forum3.id)
c4 = Comment.create(user_id: chef.id, post_id: p4.id, content: "I need a new lawmower")
Comment.create(user_id: tony.id, post_id: p4.id, content: "DM me")

p5 = Post.create(title: "Friends indeed", content: "gimme 500 for it", user_id:max.id, forum_id: forum4.id)
c1 = Comment.create(user_id: chef.id, post_id: p1.id, content: "Forever and ever.")
c2 = Comment.create(user_id: chef.id, post_id: p5.id, content: "I need a new lawmower")
c3 = Comment.create(user_id: tony.id, post_id: p5.id, content: "DM me")
l1 = Like.create(user_id: tony.id, comment_id: c1.id)
l2 = Like.create(user_id: max.id, comment_id: c2.id)
l3 = Like.create(user_id: tony.id, comment_id: c4.id)
l4 = Like.create(user_id: max.id, comment_id: c3.id)

p1.update(slug: to_slug(p1.title))
p2.update(slug: to_slug(p2.title))
p3.update(slug: to_slug(p3.title))
p4.update(slug: to_slug(p4.title))
p5.update(slug: to_slug(p5.title))


fa1 = ForumAdmin.create(forum_id: forum.id, user_id: tony.id)
fa2 = ForumAdmin.create(forum_id: forum.id, user_id: max.id)
