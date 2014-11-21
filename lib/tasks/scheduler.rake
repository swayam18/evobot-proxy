desc "This task is called by the Heroku scheduler add-on"

task :clear_positions => :environment do
  puts "Removing Positions..."
  Position.clear
  puts "done."
end
