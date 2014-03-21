#gems
require 'active_record'

#eqb files
require_relative 'eqbuddy'
require_relative 'ment-box'
require_relative 'relations'



$DIR = File.expand_path File.dirname(__FILE__)

ActiveRecord::Base.logger = Logger.new(File.open($DIR + '/database/eqb_db.log', 'w'))

ActiveRecord::Base.establish_connection(
  :adapter  => 'jdbcsqlite3',
  :database => $DIR + '/database/eqbuddy.db'
)




