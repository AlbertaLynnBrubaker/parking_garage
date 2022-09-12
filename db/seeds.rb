# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Ticket.destroy_all
ParkingSpace.destroy_all
Commuter.destroy_all

puts 'Seeding...'

5.times do |f|
  20.times do |s|
    ParkingSpace.create(space_number: s+1, floor: f+1)
  end
end

rand(40..99).times do |c|
  Commuter.create(vehicle_make_and_model: Faker::Vehicle.make_and_model, license_plate_number: Faker::Vehicle.unique.license_plate)
end

Commuter.all.size.times do |c|
  t = Ticket.create(commuter_id: c + 1, parking_space_id: ParkingSpace.all.sample.id)

  t.parking_space.update(occupied: true)
end

puts 'Park It!'

