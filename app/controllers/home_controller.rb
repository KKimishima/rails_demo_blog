class HomeController < ApplicationController
  def index
    @results = Article.page_navigation
    @page_number = 1
  end
end
