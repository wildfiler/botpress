require 'rails_helper'

describe BotCreator do
  context 'user has account' do
    it 'creates bot belong to existing account' do
      account = instance_double(Account)
      user = instance_double(User)
      bot = instance_double(Bot)

      allow(user).to receive(:account).and_return(account)
      expect(bot).to receive(:account=).with(account)

      BotCreator.call(bot, user)
    end
  end

  context "user does't have account" do
    it 'creates bot and account to this user and bot' do
      user = build_stubbed(:user)
      bot = build_stubbed(:bot)
      account = build_stubbed(:account)

      expect(user).to receive(:save!)
      allow(Account).to receive(:create!).and_return(account)

      BotCreator.call(bot, user)

      expect(bot.account).to eq(account)
      expect(user.account).to eq(account)
    end
  end
end
