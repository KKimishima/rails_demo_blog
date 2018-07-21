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
  scope :post_list,
        ->(page_limit, page_offset) {
          includes(:user, :tag)
            .order(id: :desc)
            .limit(page_limit)
            .offset(page_offset)
        }

  scope :archive_list,
        ->(page_limit, page_offset, period) {
          includes(:tag, :user)
            .order(id: :desc)
            .where(created_at: period.in_time_zone.all_month)
            .limit(page_limit)
            .offset(page_offset)
        }

  # pageのでも
  def self.page_navigation(page_limit: 5, page_number: 1)
    page = (page_number - 1) * page_limit
    self.post_list(page_limit, page)
  end

  def self.archive_page_navigation(page_limit: 5, page_number: 1, period: "")
    page = (page_number - 1) * page_limit
    self.archive_list(page_limit, page, period)
  end

  def self.archives_count
    results = Article.order("year_created_at", "month_created_at")
                .group("YEAR(created_at)")
                .group("MONTH(created_at)")
                .count(:created_at)
    archives = {}
    results.each do |reslut|
      key = reslut[0][0].to_s + "-" + reslut[0][1].to_s + "-" + "1"
      item = reslut[0][0].to_s + "年" + reslut[0][1].to_s + "月" + "(" + reslut[1].to_s + ")"
      archives.store(key, item)
    end
    archives
  end
end
