class Note < ActiveRecord::Base
  belongs_to :household, inverse_of: :notes
end
