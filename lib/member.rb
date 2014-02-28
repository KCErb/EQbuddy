class Member < ActiveRecord::Base
  belongs_to :household, inverse_of: :heads
  belongs_to :house, class_name: "Household", inverse_of: :children
  belongs_to :district, inverse_of: :district_leader

  has_many :teach_records, inverse_of: :member
  has_many :attendance_records, inverse_of: :member

  has_many :assigned_teachers
  has_many :assignments, through: :assigned_teachers
  has_many :teachees, through: :assignments
  has_many :teachers, through: :household
  has_one  :spouse, class_name: "Member", foreign_key: :spouse_id
  delegate :address, to: :household
end
