require 'active_record'
require_relative '../config/environment'
require 'sinatra/activerecord/rake'
require_relative '../app/CLI_methods'
require_relative '../app/helpers/crime_data'
require 'pry'




def run
  puts "Hello, welcome to UK Crime report app!"
  loading_session
  print "Would you like to SIGN UP or LOG IN? Please input 's' or 'l':"
  input = gets.chomp.downcase
  case input
  when "s"
    @user = sign_up
    puts "Your username is #{@user.name}"
  #  Need to
  when "l"
    @user = log_in
    puts "Welcome back #{@user.name}! You successfully logged in!"
  end
  loading_session
  # binding.pry

  # @user = create_user
  # fix if person has been created or not - user_id within Area class should not be duplicated
  new_area = Area.create(address: get_address, user: @user )
  help
  option = gets.chomp
  case option

  when "a"
    data = CrimeData.get_crimes_for_location(@user.areas.last.latitude, @user.areas.last.longitude)
    p data

  when "b"
    data = CrimeData.get_crimes_for_location(@user.areas.last.latitude, @user.areas.last.longitude)
    crime_categories(data)   # this works


  when "c"
    data = CrimeData.get_crimes_for_location(@user.areas.last.latitude, @user.areas.last.longitude)
    p count_crimes(data)

  end

end

run
