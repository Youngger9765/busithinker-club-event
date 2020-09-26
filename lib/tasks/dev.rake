namespace :dev do

    desc "Rebuild system"
    task :rebuild => ["db:drop", "db:setup", :fake]
  
    task :fake => :environment do
        puts "club fake"
        club_names = ["數據","產品","商務"]
        club_names.each do |name|
            puts "Create event fake data for development"
            c = Club.new( :name =>name)
            c.save!
        end
        
        puts "Create event fake data for development"
        5.times do |i|
            e = Event.new( :name => Faker::Team.creature)
            e.save!
            club = Club.all.sample
            puts "club - event ships"
            EventClubship.create(:club => club, :event => e)
        end

        

        
    end
  end