# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
15.times do |i|
  user = User.create(name: "user#{i}", email: "admin#{i}@hogehoge.com")
  art = user.article.create(title: "サンプル投稿#{i}", content: 'この記事は最小にサンプルとして表示される。コンテンツです')
  tag1 = Tag.create(name: "tag1#{i}")
  tag2 = Tag.create(name: "tag2#{i + 1}")
  art.tag << tag1
  art.tag << tag2
end
