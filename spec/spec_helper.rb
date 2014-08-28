SPEC_ROOT = File.expand_path('..', __FILE__)
$LOAD_PATH << File.join('../lib', SPEC_ROOT)

$TESTING = true

require 'active_record'
require_relative 'contexts/schema_context'
require_relative '../app'
#shared_examples = File.expand_path('contexts/**/*.rb', __FILE__)
#Dir[shared_examples].each { |f| require f }
