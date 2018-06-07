class PostsController < ApplicationController
  before_action :check_page

  def show
    @post = Article.find(params[:id])
  end

  private

  def check_page
    if params[:id].to_i < 0
      redirect_to :root
    end
  end
end
