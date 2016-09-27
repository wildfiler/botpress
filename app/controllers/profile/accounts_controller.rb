module Profile
  class AccountsController < ApplicationController
    before_action :require_login

    def show
      @account = current_user.account || Account.new
    end
  end
end
