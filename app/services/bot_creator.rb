class BotCreator
  def self.call(bot, user)
    bot.account = user.account || create_account_for(user)
    bot
  end

  def self.create_account_for(user)
    user.account = Account.create!
    user.save!
    user.account
  end
end
