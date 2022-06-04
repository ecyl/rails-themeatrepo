# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
require 'faker'

puts "Cleaning database..."
Product.destroy_all
Butchery.destroy_all
User.destroy_all
Review.destroy_all
Order.destroy_all

names = ["Wagyu beef", "Sirloin Steak", "Chicken", \
        "Pork", "Turkey", "Flank Steak", "Ground Beef", "Beef Shank", \
        "Pork Belly", "Pork Rib", "Pork Tenderloin", "Bacon", "Ground Pork", "Ham", "Pork Shoulder"]
country = %w[Australia US Japan India Argentina Canada NZ Brazil]

puts "Creating Sellers..."

10.times do
  seller = User.new(
    email: Faker::Internet.email,
    name: Faker::Name.name,
    address: Faker::Address.street_address,
    password: "12345678",
    phone_number: Faker::PhoneNumber.cell_phone,
    role: "seller"
  )
  seller.save
end

sellers = User.all

puts "Creating Butcheries..."

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
      expiration_date: Faker::Date.between(from: Date.today, to: 12.days.from_now),
      discount_percentage: [10, 15, 20, 25, 30, 35, 40].sample
    )
    product.butchery = butchery
    product.save
  end
end

puts "Creating Customers..."

10.times do
  customer = User.new(
    email: Faker::Internet.email,
    name: Faker::Name.name,
    address: Faker::Address.street_address,
    password: "12345678",
    phone_number: Faker::PhoneNumber.cell_phone,
    role: "buyer"
  )
  customer.save
end

customers = User.where(role: "buyer")
butcheries = Butchery.all
products = Product.all

puts "Creating Orders...."
10.times do |i|
  order = Order.new(
    quantity: 5
  )
  order.user = customers[i]

  order.user = sellers[i]

  order.product = products[i]
  order.save
end

puts "Creating Reviews..."

10.times do |i|
  review = Review.new(
    comment: Faker::Restaurant.review,
    rating: [1..5].sample
  )
  review.user = customers[i]
  review.butchery = butcheries[i]
  review.save
end

puts "Finished"
