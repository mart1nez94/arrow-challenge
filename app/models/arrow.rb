class Arrow < ApplicationRecord
  belongs_to :user

  def self.by_user(user_id)
    Arrow.all.where(to_user_id: user_id)
  end
end
