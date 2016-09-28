namespace :data do
  namespace :bot do
    desc 'Import items for all bots, specific bot or bots from account'
    task :import, [:type, :id] => :environment do |_, args|
      Rails.logger = Logger.new(STDOUT)
      ActiveRecord::Base.logger = nil

      type = args[:type] || 'all'

      bots = case type
            when 'all'
              Bot.all
            when 'bot'
              Bot.find(args[:id])
            when 'account'
              Account.find(args[:id]).bots
            else
              raise 'Wrong type argument'
            end

      import_items_for(bots)
    end
  end
end

def import_items_for(bots)
  SteamImporter.new(bots, verbose: true).import
end
