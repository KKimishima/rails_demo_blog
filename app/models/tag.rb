# == Schema Information
#
# Table name: tags
#
#  id         :bigint(8)        not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ApplicationRecord
  # タグ名の空、同じ禁止
  validates :name, uniqueness: true, presence: true
  # tagテーブルが所有されていること
  has_many :article_tag, dependent: :destroy
  # 中間テーブルの設定
  has_many :article, through: :article_tag

  # pageのでも
  def self.page_navigation(id:, page_limit: 5, page_number: 1)
    page_offset = (page_number.to_i - 1) * page_limit
    tags = self.includes(:article, :article_tag).find(id)
    tags.article.order(id: :desc).limit(page_limit).offset(page_offset)
  end
end
