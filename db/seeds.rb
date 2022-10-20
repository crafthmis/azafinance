# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Create some users
num_users = 10000

# Each is subscribed to some number of other users
subscriptions_per_user = 5

fraction_susbcriptions_exist = subscriptions_per_user.fdiv(num_users)

# Each person has posted many posts
posts_per_user = 4000

# Over this many days in the past
max_history_duration_days = 90

