class SteamImporter
  def initialize(bots, fetcher: Steam::Fetcher.new)
    @bots = bots
    @fetcher = fetcher
  end

  def import
    ActiveRecord::Base.transaction do
      @games = Game.published

      @bots.each do |bot|
        @games.each do |game|
          items = @fetcher.get(bot.steam_id, game.app_id)

          bot_items = bot.items.select { |item| item.game_id == game.id }
          bot_items_ids = bot_items.map(&:steam_id)
          items_ids = items.map { |item| item['id'] }

          delete_old_items(bot_items, items_ids)

          create_new_items(bot, game, items, bot_items_ids)
        end

        bot.save!
      end
    end
  end

  def create_new_items(bot, game, items, bot_items_ids)
    items.each do |item|
      next if bot_items_ids.include?(item['id'])

      bot.items.new(
        game: game,
        steam_id: item['id'],
        classid: item['classid'],
        instanceid: item['instanceid'],
        amount: item['amount'],
        raw: item['raw']
      )
    end
  end

  def delete_old_items(bot_items, items_ids)
    bot_items.each do |bot_item|
      bot_item.destroy if items_ids.exclude?(bot_item.steam_id)
    end
  end
end
