module Bots
  class GamesController < ApplicationController
    def show
      @bot = Bot.find(params[:bot_id])
      game = Game.find(params[:id])
      @game = GameForBot.new(game, @bot)
    end
  end
end
