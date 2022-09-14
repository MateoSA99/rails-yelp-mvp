# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts 'cleaning DB...'
Restaurant.delete_all
puts 'DB cleaned'

10.times do
  restaurant_instance = Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_name,
    phone_number: Faker::PhoneNumber.cell_phone,
    category: %w[chinese italian japanese french belgian].sample
  )
  5.times do
    review = Review.new(
      rating: rand(0..5),
      content: Faker::Restaurant.review
    )
    review.restaurant = restaurant_instance
    review.save
  end
  puts "Creating restaurant id: #{restaurant_instance.id}"
end

puts 'Finished'

