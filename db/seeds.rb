# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

Reward.create!([{
  name: "Free Coffee reward",
  scope: "more then 100 points"
},
{
  name: "Free Coffee reward",
  scope:"on birthday month"
},
{
  name: "Movie Tickets reward",
  scope: "spending more then 1000"
},
{
  name: "Airport Lounge Access Reward",
  scope: "gold tier customer"
}])


Loyalty.create!([{
  name: "standard tier customer",
  scope: "0 points"
},
{
  name: "gold tier customer",
  scope:"1000 points"
},
{
  name: " platinum tier customer",
  scope: "5000 points"
}])