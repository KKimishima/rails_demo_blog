class Article < ApplicationRecord
  # userテーブルを所有する設定
  belongs_to :user
  has_many :article_tag
  has_many :tag, through: :article_tag
end
