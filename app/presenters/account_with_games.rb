class AccountWithGames < SimpleDelegator
  def initialize(account)
    @account = account
    super
  end

  def games
    Game.published.map { |game| GameForAccount.new(game, @account) }
  end
end
