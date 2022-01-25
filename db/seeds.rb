# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Driver.destroy_all
# ActiveRecord::Base.connection.execute("Delete from drivers")
drivers = Driver.create([{name: "Zach", phone: "6038013776"}, {name: "Driver 2", phone: "1234567890"}, {phone: "0987654321"}])