require_relative "./models/area"
require 'pry'

def help
  puts "
  Please select from the following options- using numbers (a - d) as your input:
  - (a) - See all data (unformatted)
  - (b) - See all crime categories reported in your chosen area
  - (c) - Count the number of crimes in your chosen area
  - (d) - See a report of the crime categories and the number of times committed
  - (e) - See all instances of crime by their categories and their respective outcomes
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
    if User.all.find{ |user| user.name == user_name }
      puts 'That username exists, please enter a new one:'
      user = user_name
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
    if !user
      puts "User name not found, please try again"
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
#
# def categories_and_outcome(data)
#   new_data = {}
#
#   data.each do |field, field_value|
#     field_value.each do |info|
#
#       new_data[in]
# end


# def outcome_categories(data)
#   new_hash = {}
#   data.each do |crime|
#     crime.each do |field, field_value|
#       if new_hash["outcome_status"]
#         new_hash["outcome_status"]["category"] << field
#
#
#
#       new_hash[field_value["outcome_status"]["category"]]
#         binding.pry
#       ## if new_hash[field_value].first
#       ##   new_hash[field_value]
#       ## if new_hash["outcome_status"][field_value]
#       p "hi"
#     end
#   end
#   p "hi"
# end

# def outcome_categories(data)
#   new_hash = {}
#   data.each do |crime|
#     crime.each do |field, field_value|
#       ["category"].each do |info, precise|
#         binding.pry
#       # if new_hash[field_value].first
#       #   new_hash[field_value]
#       # if new_hash["outcome_status"][field_value]
#       end
#       p "hi"
#     end
#   end
#   p "hi"
# end


#
# def outcome_categories(data)
#   new_hash = {}
#   data.each do |crime|
#     crime.each do |field, field_value|
#       binding.pry
#       p "hi"
#     end
#   end
#   p "hi"
# end

  # (e) - See all instances of crime by their categories and their respective outcomes
