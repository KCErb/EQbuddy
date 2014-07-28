#gems
require 'active_record'
require 'shoes'
require 'bundler/setup'

#models
require_relative 'models/relations'
#views
require_relative 'views/ment-box'

#controllers
require_relative 'controllers/start'


# 'connect' to database
#ActiveRecord::Base.logger = Logger.new('lib/database/eqb_db.log', 'w')
ActiveRecord::Base.establish_connection(
  :adapter  => 'jdbcsqlite3',
  :database => 'lib/database/eqbuddy.db'
)
