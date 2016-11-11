module Accounts
  class GamesController < ApplicationController
    def show
      @account = Account.find(params[:account_id])
      game = Game.friendly.find(params[:id])
      @game = GameForAccount.new(game, @account)
      if params[:filter_values].present?
        @game = GameWithFiltredItems.new(@game, params[:filter_values])
      end
      @game = GameWithPaginateItems.new(@game, params[:page])
    end
  end
end
