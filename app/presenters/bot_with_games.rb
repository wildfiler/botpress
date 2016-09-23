class BotWithGames < SimpleDelegator
  def initialize(bot)
    @bot = bot
    super
  end

  def games
    Game.published.map { |game| GameForBot.new(game, @bot) }
  end
end
