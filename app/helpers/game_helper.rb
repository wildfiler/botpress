module GameHelper
  def list_of_games
    Game.all.map { |game| [game.name, game.id] }
  end
end
