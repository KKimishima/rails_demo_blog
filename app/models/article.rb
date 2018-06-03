# == Schema Information
#
# Table name: articles
#
#  id         :bigint(8)        not null, primary key
#  content    :text(65535)
#  title      :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint(8)
#

class Article < ApplicationRecord
  # userテーブルを所有する設定
  belongs_to :user
  has_many :article_tag
  has_many :tag, through: :article_tag
end
