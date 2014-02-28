class ActionItem < ActiveRecord::Base
  belongs_to :user, inverse_of: :action_items
end
