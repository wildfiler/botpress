class BotImporterJob < ApplicationJob
  queue_as :default

  def perform(bot_id)
    bot = Bot.find(bot_id)
    @importer_class.new(bot).import
  end

  def initialize(*args, importer_class: SteamImporter)
    @importer_class = importer_class
    super(*args)
  end
end
