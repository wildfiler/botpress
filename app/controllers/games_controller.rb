class GamesController < ApplicationController
  def show
    @game = Game.friendly.find(params[:id])
    @items = @game.items.paginate(page: params[:page])
  end
end
