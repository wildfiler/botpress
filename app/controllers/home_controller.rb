class HomeController < ApplicationController
  def index
    @games = Game.published.ordered
  end
end
