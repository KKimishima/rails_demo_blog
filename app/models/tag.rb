class Tag < ApplicationRecord
  # tagテーブルが所有されていること
  has_many :article_tag
  # 中間テーブルの設定
  has_many :article, through: :article_tag
end
