# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# 500.times do |i|
#     Product.create(
#       title: "This is my seed product #{i + 1}",
#       description: "This is my seed product description #{i + 1}"
#     )
#   end


#   # db/seeds.rb

# # Function to generate a random email
# def generate_random_email
#     characters = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
#     random_email = (0...10).map { characters[rand(characters.length)] }.join + "@example.com"
#   end
  
#   # Seed data for stuffs
#   50.times do
#     role_id = rand(1..3)
#     email = generate_random_email
#     password = "123456"
  
#     Stuff.create(
#       email: email,
#       password: password,
#       role_id: role_id
#     )
#   end

#   # db/seeds.rb

# # Seed data for suppliers
# 200.times do |i|
#     Supplier.create(
#       name: "Supplier #{i + 1}"
#     )
#   end
  
# 100.times do
#   PurchaseOrder.create(
#     total_price: rand(100..1000),
   
#   )
# end