class BotsController < ApplicationController
  def show
    @bot = BotWithGames.new(Bot.find(params[:id]))
  end
end
