require 'rails_helper'

describe GameWithFiltredItems do
  it 'returns game with items mathced filter' do
    game = create(:game)
    filter_type = create(:filter_type, game_id: game.id)
    filter_value = create(:filter_value, filter_type_id: filter_type.id)
    filtred_items = create_list(:item, 2, game: game)
    filtred_items.each { |item| item.filter_values = [filter_value] }
    _other_item = create(:item, game: game)

    game = GameWithFiltredItems.new(game, [filter_value.id])
    expect(game.items).to match_array(filtred_items)
  end

  context 'few filters' do
    it 'returns items with all filters matched' do
      game = create(:game)
      filter_type = create(:filter_type, game_id: game.id)
      filter_value1, filter_value2 = create_list(:filter_value, 2, filter_type_id: filter_type.id)
      filtred_item = create(:item, game: game)
      filtred_item.filter_values = [filter_value1, filter_value2]

      partly_filtred_item = create(:item, game: game)
      partly_filtred_item.filter_values = [filter_value1]

      game = GameWithFiltredItems.new(game, [filter_value1, filter_value2])
      expect(game.items).to match_array([filtred_item])
    end
  end
end
