class ArticlesController < ApplicationController
  before_action :require_login, only: [:create, :new]
  before_action :set_article, only: [:show]

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    respond_to do |format|
      if @article.save
        format.html {redirect_to @article, notice: 'Blog was successfully created.'}
      else
        format.html {render :new}
      end
    end
  end

  private

  def require_login
    redirect_to root_url unless login_in?
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content, :user_id)
  end
end
