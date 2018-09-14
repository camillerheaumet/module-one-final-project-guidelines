require 'active_record'
require_relative '../config/environment'
require 'sinatra/activerecord/rake'
require_relative '../app/CLI_methods'
require_relative '../app/helpers/crime_data'
require 'pry'

def sign_or_log
    print "Would you like to SIGN UP or LOG IN? Please input 's' or 'l':"
    input = gets.chomp.downcase
    case input
    when "s"
      @user = sign_up
      puts "Your username is #{@user.name}"
    when "l"
      @user = log_in
      puts "Welcome back #{@user.name.capitalize}! You have logged in successfully!"
    end
end

def data_search
  true_data = true
  while true_data do
    new_area = Area.create(address: get_address, user: @user )
    if !!@user.areas.last.latitude
      true_data = false
    else
      puts "This Postcode is NOT valid."
    end
 end
 CrimeData.get_crimes_for_location(@user.areas.last.latitude, @user.areas.last.longitude)
end

def run
  puts "Hello, welcome to UK Crime report app!"
  loading_session

  sign_or_log
  loading_session
  # binding.pry
  data = data_search

  continue_research = true
  while continue_research do
    loading_session
    help
    option = gets.chomp
    case option

    when "a"
      puts crime_categories(data).uniq   # this works

    when "b"
      p count_crimes(data)

    when "c"
      puts "-----------"
      categories_and_count(data).each do |cat|
        puts cat
        puts "-----------"
      end

    when "d"
      puts "-----------"
      categories_and_outcomes(data).each do |crime_cat, outcome|
        puts ""
        puts crime_cat.upcase
        puts ""
        outcome.each do |k, v|
          puts "#{k} - #{v}"
        end
        puts ""
        puts "-----------"
      end

    when "new"
      system("clear")
      data = data_search


    when "exit"
      continue_research = false
      loading_session
      system("clear")
      puts "Goodbye!"
      break

# easter egg
                                                                                                                                                  when "wait"        # easter egg
                                                                                                                                                    2.times do
                                                                                                                                                      loading_session
                                                                                                                                                    end
                                                                                                                                                    easter_egg
                                                                                                                                                    1.times do
                                                                                                                                                      loading_session
                                                                                                                                                    end

    end
  end  # end of while loop

end

system("clear")
run
