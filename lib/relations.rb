
class ActionItem < ActiveRecord::Base
  belongs_to :user, inverse_of: :action_items
end

class AssignedTeachee < ActiveRecord::Base
  belongs_to :assignment
  belongs_to :teachee, class_name: "Household", foreign_key: :household_id
end

class AssignedTeacher < ActiveRecord::Base
  belongs_to :assignment
  belongs_to :teacher, class_name: "Member", foreign_key: :member_id
end

class Assignment < ActiveRecord::Base
  belongs_to :district
  has_one :district_leader, through: :district
  has_many :assigned_teachers
  has_many :assigned_teachees
  has_many :teachers, through: :assigned_teachers, foreign_key: :member_id
  has_many :teachees, through: :assigned_teachees, foreign_key: :household_id
end

class AttendanceRecord < ActiveRecord::Base
  belongs_to :member, inverse_of: :attendance_records
end

class District < ActiveRecord::Base
  has_many :assignments
  has_one :district_leader, class_name: "Member", inverse_of: :district
end

class Household < ActiveRecord::Base
  belongs_to :ward, inverse_of: :households
  has_many :tags, inverse_of: :household
  has_many :notes, inverse_of: :household
  has_many :taught_records, inverse_of: :household

  has_many :heads, class_name: "Member", foreign_key: :household_id, inverse_of: :household, dependent: :destroy
  has_many :children, class_name: "Member", foreign_key: :house_id, inverse_of: :house, dependent: :destroy

  has_many :household_tags
  has_many :tags, through: :household_tags
  has_many :assigned_teachees
  has_many :assignments, through: :assigned_teachees
  #has_many :teachers, through: :assignments
  def teachers(month)
    ment = self.assignments.find_by_month(month)
    ment.teachers
  end
end

class HouseholdTag < ActiveRecord::Base
  belongs_to :tag
  belongs_to :household
end

class Member < ActiveRecord::Base
  belongs_to :household, inverse_of: :heads
  belongs_to :house, class_name: "Household", inverse_of: :children
  belongs_to :district, inverse_of: :district_leader

  has_many :teach_records, inverse_of: :member
  has_many :attendance_records, inverse_of: :member

  has_many :assigned_teachers
  has_many :assignments, through: :assigned_teachers
  has_many :teachers, through: :household
  has_one  :spouse, class_name: "Member", foreign_key: :spouse_id
  delegate :ward, to: :household
  delegate :children, to: :household
  delegate :add1, to: :household
  delegate :add2, to: :household

  def teachees(month)
    ments = self.assignments.where(month: month)
    ments.each.collect{|ment| ment.teachees}.flatten
  end
  
  def teachers(month)
    self.household.teachers(month)
  end

  def companions(month)
    ment = self.assignments.where(month: month)
    ment.each.collect{|ment| ment.teachers}.flatten - [self]
  end
end

class Note < ActiveRecord::Base
  belongs_to :household, inverse_of: :notes
end

class Setting < ActiveRecord::Base
  belongs_to :user, inverse_of: :settings
end

class TaughtRecord < ActiveRecord::Base
  belongs_to :household, inverse_of: :taught_records
end

class TeachRecord < ActiveRecord::Base
  belongs_to :member, inverse_of: :teach_records
end

class Tag < ActiveRecord::Base
  has_many :household_tags
  has_many :households, through: :household_tags
end

class User < ActiveRecord::Base
  belongs_to :ward, inverse_of: :users
  has_many :action_items, inverse_of: :user
  has_many :settings, inverse_of: :user
end

class Ward < ActiveRecord::Base
  has_many :households, inverse_of: :ward
  has_many :users, inverse_of: :ward
end
