require 'active_record'

require_relative 'relations'

#require_relative 'slot'
#require_relative 'dynamic_slot'
#require_relative 'manageable_slot'
#require_relative 'slot_manager'



$DIR = File.expand_path File.dirname(__FILE__)

ActiveRecord::Base.logger = Logger.new(File.open($DIR + '/eqb_db.log', 'w'))

ActiveRecord::Base.establish_connection(
  :adapter  => 'jdbcsqlite3',
  :database => $DIR + '/eqbuddy.db'
)




