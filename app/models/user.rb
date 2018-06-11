# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  # パスワーの設定
  has_secure_password
  validates :name, presence: true, uniqueness: true
  # ユーザ名の空だめ、重複だめ
  validates :name, uniqueness: true, presence: true

  # userが複数に所有されることを示し、削除したときまとめて消す
  has_many :article, dependent: :destroy


end
