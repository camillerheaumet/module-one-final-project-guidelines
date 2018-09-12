require_relative '../config/environment'
require_relative '../app/CLI_methods'
# require 'geocoder'
def run
  puts "Hello, welcome to UK Crime report app!"
  @user = create_user
  @user.address = get_address
  help
  option = gets.chomp
  case option
  when "a"
    puts "Enter address:"
    user_address = gets.chomp.downcase
    # WHAT NEXT?
  end
end

# run
run
