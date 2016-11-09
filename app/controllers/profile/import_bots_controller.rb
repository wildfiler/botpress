module Profile
  class ImportBotsController < ApplicationController
    before_action :require_login

    def create
      BotImporterJob.perform_later(params[:bot_id])
    end
  end
end
