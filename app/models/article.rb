class Article < ApplicationRecord
  # userテーブルを所有する設定
  belongs_to :user
end
