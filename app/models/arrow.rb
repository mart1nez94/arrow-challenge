class Arrow < ApplicationRecord
  belongs_to :user
  validates_presence_of :reason, :user_id, :from_user_id
end
