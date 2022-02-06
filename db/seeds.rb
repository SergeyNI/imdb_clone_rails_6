# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

if User.all.count.zero?
  1.upto 10 do |count|
    user = User.create!(email: "user#{count}@example.com",password: "userpwd#{count}") 
    puts(user.email)
  end
end
if Category.all.count.zero?
  Category.create(name: "fantasy")
  Category.create(name: "blockbaster")
  Category.create(name: "romantic")
end


# if AdminUser.all.count.zero?
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?