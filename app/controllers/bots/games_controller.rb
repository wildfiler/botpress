module Bots
  class GamesController < ApplicationController
    def show
      @bot = Bot.friendly.find(params[:bot_id])
      game = Game.friendly.find(params[:id])
      @game = GameForBot.new(game, @bot)
    end
  end
end
