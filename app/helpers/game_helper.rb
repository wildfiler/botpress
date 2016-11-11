module GameHelper
  def games_options
    Game.all.pluck(:name, :id)
  end
end
