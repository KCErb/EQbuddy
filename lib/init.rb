#gems
require 'active_record'
require 'shoes'
require 'bundler/setup'

#models
models = File.expand_path('lib/models/*.rb')
Dir[models].each { |f| require f }
#views
views = File.expand_path('lib/views/*.rb')
Dir[views].each { |f| require f }
#controllers
controllers = File.expand_path('lib/controllers/*.rb')
Dir[controllers].each { |f| require f }
#boots
#File.expand_path('lib/boots')

# 'connect' to database unless testing since specs have their own db
unless $TESTING
  ActiveRecord::Base.establish_connection(
    :adapter  => 'jdbcsqlite3',
    :database => 'lib/database/eqbuddy.db'
  )
end
