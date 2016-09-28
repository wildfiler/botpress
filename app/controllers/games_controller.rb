class GamesController < ApplicationController
  def show
    @game = Game.friendly.find(params[:id])
  end
end
