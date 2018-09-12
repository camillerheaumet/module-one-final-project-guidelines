require_relative "./models/area"

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

def create_user
  puts "Please enter your name:"
  user_name = gets.chomp.downcase
  User.create(name: user_name)
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
  puts categories.uniq
end

def count_crimes(data)
  data.size
end
