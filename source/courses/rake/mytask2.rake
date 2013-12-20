desc 'Make yourself in the database'
task :makeuser => :environment do
  p User.create!(name: ENV['USER'])
end
