module Bots
  class GamesController < ApplicationController
    def show
      @bot = Bot.friendly.find(params[:bot_id])
      game = Game.friendly.find(params[:id])
      @game = GameForBot.new(game, @bot)
      @items = @game.items.paginate(page: params[:page])
    end
  end
end
