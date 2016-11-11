class GamesController < ApplicationController
  def show
    @game = Game.friendly.find(params[:id])
    if params[:filter_values].present?
      @game = GameWithFiltredItems.new(@game, params[:filter_values])
    end
    @game = GameWithPaginateItems.new(@game, params[:page])
  end
end
