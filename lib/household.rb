class Household < ActiveRecord::Base
  belongs_to :ward, inverse_of: :households
  has_many :tags, inverse_of: :household
  has_many :notes, inverse_of: :household
  has_many :taught_records, inverse_of: :household

  has_many :heads, class_name: "Member", foreign_key: :household_id, inverse_of: :household, dependent: :destroy
  has_many :children, class_name: "Member", foreign_key: :house_id, inverse_of: :house, dependent: :destroy #Sour Grapes

  has_many :household_tags
  has_many :tags, through: :household_tags
  has_many :assigned_teachees
  has_many :assignments, through: :assigned_teachees
  has_many :teachers, through: :assignments
end
