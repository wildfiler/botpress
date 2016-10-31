module Admin
  class ItemsController < AdminController
    def index
      @items = Item.all.paginate(page: params[:page])
    end

    def show
      @item = Item.find(params[:id])
    end
  end
end
