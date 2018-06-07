class PageController < ApplicationController
  before_action :check_page

  def show
    @page_number = params[:id].to_i
    @results = Article.page_navigation(page_id: @page_number)
    render 'home/index'
  end

  private

  def check_page
    if params[:id].to_i < 1
      redirect_to :root
    end
  end
end