class User < ApplicationRecord
  # userが複数に所有されることを示し、削除したときまとめて消す
  has_many :article, dependent: :destroy
end
