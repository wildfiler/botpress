module Profile
  class ImportBotsController < ApplicationController
    before_action :require_login

    def create
      bot_id = params[:bot_id]
      if bot_id
        bot = Bot.find_by(id: bot_id)
        if bot && current_user.account == bot.account
          BotImporterJob.perform_later(bot_id)
        end
      end
      redirect_to profile_account_path
    end
  end
end
