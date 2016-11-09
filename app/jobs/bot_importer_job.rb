class BotImporterJob < ApplicationJob
  queue_as :default

  def perform(bot_id)
    bot = Bot.find(bot_id)
    SteamImporter.new(bot).import
  end
end
