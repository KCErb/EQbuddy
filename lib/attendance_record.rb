class AttendanceRecord < ActiveRecord::Base
  belongs_to :member, inverse_of: :attendance_records
end
