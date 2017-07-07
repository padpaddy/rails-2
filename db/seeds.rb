# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = []
fake_content = []
users[0] = {first_name: "Hita", last_name: "Lopo", email: "mat@com.fd", password: "123456"}
users[1] = {first_name: "Nixa", last_name: "Misu", email: "nix@com.fd", password: "123456"}
users[2] = {first_name: "Ciae", last_name: "Rem", email: "re@com.fd", password: "123456"}
users[3] = {first_name: "John", last_name: "Hope", email: "ho@com.fd", password: "123456"}

fake_content[0] = "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even. The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fuga cumque omnis molestias aperiam sapiente similique quaerat eius, eveniet vel, nulla quia nesciunt obcaecati."
fake_content[1] = "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente laborum, voluptatem assumenda odio suscipit eveniet ea nihil praesentium facere saepe."
fake_content[2] = "recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quod nesciunt vero, iusto facilis."
fake_content[3] = "The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tempore et, omnis voluptatibus at fuga laboriosam fugit modi optio quod deserunt."
fake_content[4] = "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Asperiores, repellat."

users.length.times do |i| 
	User.create(users[i])
	User.last.posts.create({content: fake_content[rand(0..2)]})
	User.last.posts.create({content: fake_content[rand(3..4)]})
end

Post.all.each {
	|post|
	post.comments.create({content: fake_content[rand(0..4)], user_id: rand(1..4)})
}

