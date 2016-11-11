namespace :db do
  desc 'Populate DB with test data'
  task populate: :environment do
    load Rails.root.join 'db/populate.rb'

    Rake::Task["data:bot:import"].invoke
  end
end
