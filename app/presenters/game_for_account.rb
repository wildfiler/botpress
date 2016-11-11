class GameForAccount < SimpleDelegator
  def initialize(game, account)
    @game = game
    @account = account
    super(game)
  end

  def items
    super.where(bot: @account.bots)
  end
end
