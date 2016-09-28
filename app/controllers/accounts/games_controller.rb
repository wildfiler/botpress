module Accounts
  class GamesController < ApplicationController
    def show
      @account = Account.find(params[:account_id])
      game = Game.find(params[:id])
      @game = GameForAccount.new(game, @account)
    end
  end
end