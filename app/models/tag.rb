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
  has_many :article_tag
  # 中間テーブルの設定
  has_many :article, through: :article_tag
end
