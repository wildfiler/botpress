module Bots
  class GamesController < ApplicationController
    def show
      @bot = Bot.friendly.find(params[:bot_id])
      game = Game.friendly.find(params[:id])
      @game = GameForBot.new(game, @bot)
      if params[:filter_values].present?
        @game = GameWithFiltredItems.new(@game, params[:filter_values])
      end
      @game = GameWithPaginateItems.new(@game, params[:page])
    end
  end
end
