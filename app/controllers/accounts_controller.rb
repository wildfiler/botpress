class AccountsController < ApplicationController
  def show
    @account = AccountWithGames.new(Account.find(params[:id]))
  end
end
