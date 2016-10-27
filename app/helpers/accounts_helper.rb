module AccountsHelper
  def options_for_account
    Account.all.includes(:users).map do |account|
      [account.name, account.id]
    end
  end
end
