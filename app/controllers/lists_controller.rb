class ListsController < ApplicationController
  before_action :set_lists, only: %i[index new create show]

  def index
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save
    redirect_to list_path(@list)
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = Bookmark.all
  end

  private

  def set_lists
    @lists = List.all
  end

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
