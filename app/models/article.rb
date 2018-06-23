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
  has_many :article_tag, dependent: :destroy
  has_many :tag, through: :article_tag
  accepts_nested_attributes_for :article_tag, allow_destroy: true
  # スコープを指定
  scope :post_list, ->(page_limit, page_offset) {includes(:user, :tag).order(id: :desc).limit(page_limit).offset(page_offset)}

  # pageのでも
  def self.page_navigation(page_limit: 5, page_number: 1)
    page = (page_number - 1) * page_limit
    self.post_list(page_limit, page)
  end
end
