require 'rails_helper'

describe BotImporterJob, type: :job do
  describe '#perform' do
    it 'calls on the SteamImporter' do
      bot = double(:bot, id: 1)
      import_status = double(:import_status, id: 2)
      importer_class = double(:importer_class)
      importer = instance_double(SteamImporter)
      allow(Bot).to receive(:find).and_return(bot)
      allow(ImportStatus).to receive(:find).and_return(import_status)
      allow(import_status).to receive(:status=).and_return('finished')

      expect(importer_class).to receive(:new).with(bot).and_return(importer)
      expect(importer).to receive(:import)
      expect(import_status).to receive(:status=).with('finished')

      BotImporterJob.new(importer_class: importer_class).perform(bot.id, 4)
    end
  end

  describe '.perform_later' do
    it 'perform_later adds bot_improter to queue' do
      allow(SteamImporter).to receive_message_chain(:new, :import)

      BotImporterJob.perform_later(1)

      expect(enqueued_jobs.last[:job]).to eq BotImporterJob
    end
  end

  it 'is in bot_importer queue' do
    expect(BotImporterJob.new.queue_name).to eq('bot_importer')
  end
end
