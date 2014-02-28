class Setting < ActiveRecord::Base
  belongs_to :user, inverse_of: :settings
end
