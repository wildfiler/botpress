bots_steam_ids = %w{
  76561198211677395
  76561198211664841
  76561198211677627
  76561198014020282
  76561198023163691
  76561198012340941
  76561198019305432
  76561197972331023
}

bots_steam_ids.each_slice(3).each_with_index do |steam_ids, index|
  account = Account.create!
  User.create!(
    account: account,
    email: "user#{index}@example.com",
    password: '12345678'
  )

  steam_ids.each do |steam_id|
    Bot.create!(steam_id: steam_id, account: account)
  end
end
