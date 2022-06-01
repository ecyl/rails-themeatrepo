# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# products 20 products
# butchery 10 butcheries
require 'faker'

puts "Cleaning database..."
Product.destroy_all
Butchery.destroy_all
User.destroy_all
Review.destroy_all

names = ["Wagyu beef", "Sirloin Steak", "Chicken", "Pork"]
country = %w[Australia US Japan]

puts "Creating Sellers..."

10.times do
  seller = User.new(
    email: Faker::Internet.email,
    name: Faker::Name.name,
    address: Faker::Address.street_address,
    password: Faker::Compass.quarter_wind,
    phone_number: Faker::PhoneNumber.cell_phone,
    role: "seller"
  )
  seller.save
end

sellers = User.all

puts "Creating butcheries..."

10.times do |i|
  butchery = Butchery.new(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.cell_phone
  )
  butchery.user = sellers[i]
  butchery.save

  20.times do
    product = Product.new(
      name: names.sample,
      price: Faker::Number.decimal(l_digits: 2),
      country: country.sample,
      expiration_date: Faker::Date.in_date_period
    )
    product.butchery = butchery
    product.save
  end
end

puts "Creating Customers and reviews..."

10.times do
  customer = User.new(
    email: Faker::Internet.email,
    name: Faker::Name.name,
    address: Faker::Address.street_address,
    password: Faker::Compass.quarter_wind,
    phone_number: Faker::PhoneNumber.cell_phone,
    role: "customer"
  )
  customer.save

  10.times do
  review = Review.new (
    content: Faker::Restaurant.review,
    ratings: [1..5].sample
  )
  end

  review.user = customer
  review.butchery = butchery
  review.save
end

puts "Finished"
