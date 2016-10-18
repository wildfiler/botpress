class BotsController < ApplicationController
  def show
    @bot = BotWithGames.new(Bot.friendly.find(params[:id]))
  end
end
