# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
15.times do |i|
  user = User.create(name: "user#{i}", email: "admin#{i}@hogehoge.com")
  art = user.article.create(title: "サンプル投稿#{i}", content:
    <<"EOS"
### このコンテンツについて
- gemをなるべく使わずにrailsをつかて見る
- ほげほげ

## 日本語サンプル
あなたは多年実にその講演感というものの上を臥せっますた。かつて場合が相談めはどうにかその学習ですですでもを得て行くなかっからも攻撃したないて、全くにはなっませますたた。

自分に使うませのはやはりすべてに恐らくないたな。まあ岡田君が教育世の中ぴたり作文を思いたく人々その師範私か指図をという小尊重ならですなたば、この今日は私か例外本位の云って、岡田さんの事の学校の私がもちろんお教育とするて私肉がお講演をしように時々お接近に打ちべきたて、まあどうにか病気をするましてくれでしょのに出だろです。
EOS
  )
  tag1 = Tag.create(name: "tag1#{i}")
  tag2 = Tag.create(name: "tag2#{i + 1}")
  art.tag << tag1
  art.tag << tag2
end
