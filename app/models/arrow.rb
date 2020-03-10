class Arrow < ApplicationRecord
  belongs_to :user

  def self.by_user(id)
    Arrow.all.where(user_id: id)
  end
end
