class HomeController < ApplicationController
  def index
    @results = Article.page_navigation
    @page_number = 1
    render 'home/index'
  end
end
