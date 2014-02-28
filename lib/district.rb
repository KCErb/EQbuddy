class District < ActiveRecord::Base
  has_many :assignments
  has_one :district_leader, class_name: "Member", inverse_of: :district
end
