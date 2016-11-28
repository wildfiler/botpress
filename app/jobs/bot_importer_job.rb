class BotImporterJob < ApplicationJob
  queue_as :bot_importer

  def perform(bot_id, import_status_id)
    bot = Bot.find(bot_id)
    import_status = ImportStatus.find(import_status_id)
    import_status.status = 'processing'
    begin
      @importer_class.new(bot).import
      import_status.status = 'finished'
    rescue
      import_status.status = 'error'
    end
  end

  def initialize(*args, importer_class: SteamImporter)
    @importer_class = importer_class
    super(*args)
  end
end
