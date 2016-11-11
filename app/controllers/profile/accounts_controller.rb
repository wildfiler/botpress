module Profile
  class AccountsController < ApplicationController
    before_action :require_login

    def show
      @account = current_user.account || Account.new
      @bots = @account.bots.paginate(page: params[:page])
    end
  end
end
