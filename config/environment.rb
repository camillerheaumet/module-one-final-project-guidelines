require 'bundler'
Bundler.require

# require 'rake'
require 'active_record'
# require 'yaml/store'
# require 'ostruct'
# require 'date'
require 'geocoder'


ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'app'
require_all 'bin'

# binding.pry

p 'eof'

# NEED TO FINISH
