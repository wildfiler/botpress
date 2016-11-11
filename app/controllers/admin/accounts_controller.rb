module Admin
  class AccountsController < AdminController
    def index
      @accounts = Account.all.paginate(page: params[:page])
    end

    def show
      @account = Account.find(params[:id])
    end
  end
end
