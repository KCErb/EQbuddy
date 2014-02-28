class AttendanceRecord < ActiveRecord::Base
  belongs_to :member, inverse_of: :attendance_records
end

class TaughtRecord < ActiveRecord::Base
  belongs_to :household, inverse_of: :taught_records
end

class TeachRecord < ActiveRecord::Base
  belongs_to :member, inverse_of: :teach_records
end
