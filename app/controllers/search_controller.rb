class SearchController < ApplicationController
  def index
    search = params[:search]
    if search
      @items = Item.search(search).paginate(page: params[:page])
    end
  end
end
