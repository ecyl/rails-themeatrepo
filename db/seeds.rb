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

puts "Creating butcheries..."
10.times do
  butchery = Butchery.new(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    contact_number: Faker::PhoneNumber.cell_phone
  )
  20.times do
    product = Product.new(
      name: %w[Wagyu Beef, Sirloin Steak, Chicken, Pork],
      price: Faker::Number.decimal(l_digits: 2),
      country: %w[Australia, US, Japan],
      expiration_date: Faker::Date.in_date_period
    )
    butchery.products << product
  end
  butchery.save
end

puts "Created"

puts "Finished!"
