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
    puts("created user #{user.email}")
  end
end
if Category.all.count.zero?
  names = %w[fantasy blockbaster romantic]
  names.each do |name|
    category = Category.create!(name: name)
    puts("created category #{category}")
  end 
end


# if AdminUser.all.count.zero?
unless AdminUser.find_by(email:'admin@example.com')
  admin = AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') # if Rails.env.development?
  puts "created admin #{admin.email}"

end
