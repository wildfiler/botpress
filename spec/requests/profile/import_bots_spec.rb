require 'rails_helper'

describe 'profile/import bots' do
  context 'bot belong to user account' do
    it 'starts bot_importer_job' do
      account = create(:account)
      user = create(:user, account: account)
      bot = create(:bot, account: account)

      login(user)
      expect do
        post '/profile/import_bots', params: { bot_id: bot.id }
      end.to have_enqueued_job(BotImporterJob).with(bot.id.to_s)
    end

    it 'redirects to profile_account_path' do
      account = create(:account)
      user = create(:user, account: account)
      bot = create(:bot, account: account)

      login(user)
      post '/profile/import_bots', params: { bot_id: bot.id }

      expect(response).to redirect_to(profile_account_path)
    end
  end

  context 'bot is not belong to user account' do
    it "denies import" do
      user = create(:user, account: create(:account))
      bot = create(:bot)

      login(user)
      expect do
        post '/profile/import_bots', params: { bot_id: bot.id }
      end.not_to have_enqueued_job(BotImporterJob)
    end

    it 'redirect to profilre account path' do
      user = create(:user, account: create(:account))
      bot = create(:bot)

      login(user)
      post '/profile/import_bots', params: { bot_id: bot.id }

      expect(response).to redirect_to(profile_account_path)
    end
  end

  context 'bot is not exists' do
    it 'denies import' do
      user = create(:user, account: create(:account))

      login(user)
      expect do
        post '/profile/import_bots', params: { bot_id: nil }
      end.not_to have_enqueued_job(BotImporterJob)
    end
  end

  context "when bot can't be found in database" do
  end

  context 'when user not login' do
    it 'denies import' do
      user = create(:user)
      some_random_id = 30
      login(user)

      expect do
        post '/profile/import_bots', params: { bot_id: some_random_id }
      end.not_to have_enqueued_job(BotImporterJob)
    end
  end
end

