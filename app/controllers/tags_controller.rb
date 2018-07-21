class TagsController < ApplicationController
  before_action :require_login, only: [:index, :update, :create, :new, :destroy, :edit]
  before_action :set_tags, only: [:show, :destroy, :edit, :update]

  def index
    @tags = Tag.count_hash
  end

  def edit
  end

  def show
    if params[:page].nil?
      @results = Tag.page_navigation(id: params[:id])
    else
      @page = params[:page].to_i
      @results = Tag.page_navigation(id: params[:id], page_number: @page)
    end
  end

  def new
    @tag = Tag.new
  end

  def update
    respond_to do |format|
      if @tag.update(tag_params)
        format.html {redirect_to @tag, notice: 'Blog was successfully updated.'}
      else
        format.html {render :edit}
      end
    end
  end

  def destroy
    @tag.destroy
    respond_to do |format|
      format.html {redirect_to tags_url, notice: 'Blog was successfully destroyed.'}
    end
  end

  def create
    @tag = Tag.new(tag_params)

    respond_to do |format|
      if @tag.save
        format.html {redirect_to @tag, notice: 'Blog was successfully created.'}
      else
        format.html {render :new}
      end
    end
  end

  private

  def require_login
    redirect_to root_url unless login_in?
  end

  def set_tags
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name)
  end

end
