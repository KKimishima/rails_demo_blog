class ArticlesController < ApplicationController
  # before_action :set_article

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  private

  def check_page
    if params[:id].to_i < 0
      redirect_to :root
    end
  end
end
