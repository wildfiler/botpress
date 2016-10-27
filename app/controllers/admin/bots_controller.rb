module Admin
  class BotsController < AdminController
    def index
      @bots = Bot.all.paginate(page: params[:page])
    end

    def show
      @bot = BotWithGames.new(Bot.friendly.find(params[:id]))
    end

    def new
      @bot = Bot.new
    end

    def create
      @bot = Bot.new(bot_params)
      if @bot.save
        redirect_to admin_bot_path(@bot)
      else
        render :new
      end
    end

    def edit
      @bot = Bot.friendly.find(params[:id])
    end

    def update
      @bot = Bot.friendly.find(params[:id])
      if @bot.update(bot_params)
        redirect_to admin_bot_path(@bot)
      else
        render :new
      end
    end

    private

    def bot_params
      params.require(:bot).permit(:name, :steam_id, :account_id)
    end
  end
end
