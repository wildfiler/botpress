module Profile
  class ImportBotsController < ApplicationController
    before_action :require_login

    def create
      bot_id = params[:bot_id]
      if bot_id && current_user.account == Bot.find(bot_id).account
        BotImporterJob.perform_later(bot_id)
      end
      redirect_to profile_account_path
    end
  end
end
