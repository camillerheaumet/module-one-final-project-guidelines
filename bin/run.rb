require 'active_record'
require_relative '../config/environment'
require 'sinatra/activerecord/rake'
require_relative '../app/CLI_methods'
require_relative '../app/helpers/crime_data'
require 'pry'




def run
  puts "Hello, welcome to UK Crime report app!"
  @user = create_user
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
