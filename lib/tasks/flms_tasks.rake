namespace :flms do

  desc 'Creates a user account'
  task :create_user, [:email] => :environment do |t, args|

    # Check params.
    unless args.email
      puts "Error: parameter 'email' not provided."
      exit
    end

    # Read the password from the command line.
    print "Please enter the password for the new user: "
    password = STDIN.gets.chomp

    # Get user.
    unless Flms::User.create email: args.email, password: password, password_confirmation: password
      puts "Error: user with email '#{args.email}' could not be created."
      exit
    end

    puts "User #{args.email} created."
  end
  
  task :convert_video_to_embed => :environment do 
      Flms::EmbedLayer.update_all("type = 'embed'","type = 'video'")
  end
end


