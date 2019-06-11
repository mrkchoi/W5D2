# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  Post.destroy_all
  Sub.destroy_all
  User.destroy_all

  # users

  User.create!(username: 'kenny', password: 'password')
  User.create!(username: 'sehwan', password: 'password')

  # subs

  user_idx = 0

  20.times do
    Sub.create!(title: Faker::Kpop.ii_groups, description: Faker::Quote.famous_last_words, moderator_id: User.all[user_idx].id)
    user_idx = (user_idx + 1) % 2
  end

  # posts

  user_idx = 0
  sub_idx = 0
  40.times do
    Post.create!(title: Faker::Quote.robin, url: Faker::Internet.url, content: Faker::Hipster.paragraph, sub_id: Sub.all[sub_idx].id, author_id: User.all[user_idx].id)

    user_idx = (user_idx + 1) % 2
    sub_idx = (sub_idx + 1) % 20
  end

end