require_relative "./models/area"
require 'pry'

def help
  puts "
  Please select from the following options- using letters (a - d) as your input:
  - (a) - See all crime categories reported in your chosen area
  - (b) - Count the number of crimes in your chosen area
  - (c) - See a report of the crime categories and the number of times committed
  - (d) - See all instances of crime by their categories and their respective outcomes
  - (new) - Enter a new Postcode
  - (exit) - Exit the app
  "
end

def loading_session
  1.upto(5) do |n|
    print "-"
    sleep 0.25
  end
  puts ""
end

def exit_app
  puts "See you next time!"
end

def get_username
  gets.chomp.downcase
end



def sign_up
  should_continue = true
  while should_continue do
    puts 'Please enter your name:'
    user_name = get_username
    if user_name == "exit"
      should_continue = false
      sign_or_log
    elsif User.all.find{ |user| user.name == user_name }
      puts 'That username exists, please enter a new one:'
    else
      user = User.create(name: user_name)
      should_continue = false
    end
  end
  user
end

def log_in
  should_continue = true
  while should_continue do
    puts "Please enter your name:"
    user_name = get_username   # method defined separately
    user = User.find_by(name: user_name)
    if user_name == "exit"
      should_continue = false
      sign_or_log
    elsif !user
      puts "User name not found, please try again or type 'exit' to go back"
    else
      should_continue = false
    end
  end
  user
end

def get_address
  puts "Please enter the UK Postcode you want to search crimes in:"
  gets.chomp.upcase
end

def crime_categories(data)    # Option b
  categories = []
  data.each do |crime|
    categories << crime["category"]
  end
  categories
end

def count_crimes(data)      # Option c
  data.size
end


def categories_and_count(data) #Option d
  hash = Hash.new(0)
  crime_categories(data).each {|category| hash[category] += 1 }
  hash.sort_by {|cat, count| count }.reverse
end


def categories_and_outcomes(data)  #Option e
  new_array = []
  new_hash = {}
  data.each do |crime|
    if crime["outcome_status"]
     new_hash = {crime["category"] => crime["outcome_status"]["category"]}
     new_array << new_hash
   else
    new_hash = {crime["category"] => "no_outcome"}
    new_array << new_hash
   end
  end
  hash = Hash.new
  new_array.each do |crime_hash|
    crime_hash.each do |key, value|
      hash[key] ||= Hash.new(0)
      hash[key][value] += 1
    end
  end
hash
end

def easter_egg
  "B O B B Y".split(" ").each {|char| print char; sleep 0.25; $stdout.flush }
  puts ""
  "- - & - -".split(" ").each {|char| print char; sleep 0.25; $stdout.flush }
  puts ""
  "- C A M -".split(" ").each {|char| print char; sleep 0.25; $stdout.flush }
  puts ""
end
