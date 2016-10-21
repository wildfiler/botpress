class GameWithPaginateItems < SimpleDelegator
  def initialize(game, page)
    @game = game
    @page = page
    super(game)
  end

  def items
    super.paginate(page: @page)
  end
end
