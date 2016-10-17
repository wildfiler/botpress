class ItemsController < ApplicationController
  def show
    @item = Item.find_by(name: params[:id]) || Item.find(params[:id])
  end
end
