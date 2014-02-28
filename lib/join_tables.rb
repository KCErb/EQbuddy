class AssignedTeachee < ActiveRecord::Base
  belongs_to :assignment
  belongs_to :teachee, class_name: "Household", foreign_key: :household_id
end

class AssignedTeacher < ActiveRecord::Base
  belongs_to :assignment
  belongs_to :teacher, class_name: "Member", foreign_key: :member_id
end

class AssignedMent < ActiveRecord::Base
  belongs_to :assignment
  belongs_to :member
end

class HouseholdTag < ActiveRecord::Base
  belongs_to :tag
  belongs_to :household
end
