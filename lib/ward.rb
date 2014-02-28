class Ward < ActiveRecord::Base
  has_many :households, inverse_of: :ward
  has_many :users, inverse_of: :ward
end
