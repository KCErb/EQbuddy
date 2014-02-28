class Tag < ActiveRecord::Base
  has_many :household_tags
  has_many :households, through: :household_tags
end
