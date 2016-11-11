module Profile
  class BotsController < ApplicationController
    before_action :require_login

    def new
      @bot = Bot.new
    end

    def create
      @bot = BotCreator.call(Bot.new(bot_params), current_user)
      if @bot.save
        redirect_to profile_account_path
      else
        render :new
      end
    end

    private

    def bot_params
      params.require(:bot).permit(:steam_id, :name)
    end
  end
end
