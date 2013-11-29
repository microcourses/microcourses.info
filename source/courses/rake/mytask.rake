desc 'Make yourself in the database'
task :makeuser do
  p User.create!(name: ENV['USER'])
end
