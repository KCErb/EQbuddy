class TeachRecord < ActiveRecord::Base
  belongs_to :member, inverse_of: :teach_records
end
