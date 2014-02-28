class User < ActiveRecord::Base
  belongs_to :ward, inverse_of: :users
  has_many :action_items, inverse_of: :user
  has_many :settings, inverse_of: :user
end
