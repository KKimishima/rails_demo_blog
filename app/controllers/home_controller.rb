class HomeController < ApplicationController
  def index
    @top_results = Article.includes(:user, :tag).limit(5)
  end
end
