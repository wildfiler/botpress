require 'rails_helper'

describe BotImporterJob, type: :job do
  describe '#perform' do
    it 'calls on the SteamImporter' do
      bot = double(:bot, id: 1)
      allow(Bot).to receive(:find).and_return(bot)
      expect_any_instance_of(SteamImporter).to receive(:import)

      described_class.new.perform(bot.id)
    end
  end

  describe '.perform_later' do
    it 'perform_later adds bot_improter to queue' do
      allow(SteamImporter).to receive_message_chain(:new, :import)

      described_class.perform_later(1)

      expect(enqueued_jobs.last[:job]).to eq described_class
    end
  end

  it 'is in default queue' do
    expect(BotImporterJob.new.queue_name).to eq('default')
  end
end
