class BookmarksController < ApplicationController
  before_action :set_bookmark, only: %i[destroy]
  before_action :set_list, only: %i[new create]

  def index
    # raise
    @bookmarks = Bookmark.all
  end

  def new
    @bookmark = Bookmark.new
    # @list = List.find(params[:list_id])
    # raise
  end

  def create
    @bookmark = Bookmark.create(bookmark_params)
    @bookmark.list = @list
    # raise
    # bookmark.list_id = List.find(params[:list_id])
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    # raise
    # @bookmark = Bookmark.find(params[:id])
    list = @bookmark.list
    @bookmark.destroy

    redirect_to list_path(list), status: :see_other
  end

  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
