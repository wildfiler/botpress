class GameWithFiltredItems < SimpleDelegator
  def initialize(game, filter_values)
    @game = game
    @filter_values = filter_values
    super(game)
  end

  def items
    items_ids = ItemFilterValue.
                where(filter_value_id: @filter_values).
                group(:item_id).
                having('COUNT(filter_value_id) = ?', @filter_values.length).
                select(:item_id)

    super.where(id: items_ids)
  end
end
