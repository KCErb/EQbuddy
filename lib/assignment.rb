class Assignment < ActiveRecord::Base
  belongs_to :district
  has_one :district_leader, through: :district
  has_many :assigned_teachers
  has_many :assigned_teachees
  has_many :teachers, through: :assigned_teachers, foreign_key: :member_id
  has_many :teachees, through: :assigned_teachees, foreign_key: :household_id
end
