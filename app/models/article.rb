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
  # タイトルの空、同じ禁止
  # コンテンツの空禁止
  validates :title, uniqueness: true, presence: true
  validates :content, presence: true

  # userテーブルを所有する設定
  belongs_to :user
  has_many :article_tag
  has_many :tag, through: :article_tag
end
