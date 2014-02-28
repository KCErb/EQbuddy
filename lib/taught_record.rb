class TaughtRecord < ActiveRecord::Base
  belongs_to :household, inverse_of: :taught_records
end
