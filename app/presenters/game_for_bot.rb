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
