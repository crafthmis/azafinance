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

puts 'seeding (could take a few minutes) ...'

ApplicationRecord.connection.execute(<<~SQL)
  insert into users(email, created_at, updated_at)
  SELECT 'user' || i || '@example.com', now(), now()
  from generate_series(1, #{num_users}) g(i)
SQL

puts 'created users'

ApplicationRecord.connection.execute(<<~SQL)
  insert into cheets(user_id, message, created_at, updated_at)
  select 
    users.id,
    'Cheet ' || i || ' from user ' || users.id,
    now() - (interval '1 day' * #{max_history_duration_days}::real * random()),
    now()
  from users
  cross join generate_series(1, #{posts_per_user}) g(i)
SQL

puts 'created cheets'

ApplicationRecord.connection.execute(<<~SQL)
  insert into subscriptions(subscriber_id, subscribed_to_id, created_at, updated_at)
  select subscribers.id, subscribed_to.id, now(), now()
  from users subscribers
  inner join users subscribed_to on subscribers.id != subscribed_to.id
  where random() < #{fraction_susbcriptions_exist}
SQL

puts 'created subscriptions'
