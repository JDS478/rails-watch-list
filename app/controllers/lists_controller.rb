class ListsController < ApplicationController
  before_action :set_list, only: %i[show]
  def index
    @lists = List.all
  end

  def show
    @lists = List.all
    # @bookmark = Bookmark.new
  end

  def new
    @list = List.new
  end

  def create
    list = List.create(list_params)
    if list.save
      redirect_to list_path(list.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
