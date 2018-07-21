class ArchivesController < ApplicationController
  def show
    if params[:page].nil?
      @results = Article.archive_page_navigation(period: params[:id])
    else
      @page = params[:page].to_i
      @results = Article.archive_page_navigation(period: params[:id], page_number: @page)
    end
    @post_date = params[:id].gsub("-1", "月").gsub("-", "年")
  end
end
