class BotWithGames < SimpleDelegator
  def initialize(bot)
    @bot = bot
    super
  end

  def games
    Game.published.map { |game| GameForBot.new(game, @bot) }
  end

  class GameForBot < SimpleDelegator
    def initialize(game, bot)
      @game = game
      @bot = bot
      super(game)
    end

    def items
      super.where(bot: @bot)
    end
  end
end
