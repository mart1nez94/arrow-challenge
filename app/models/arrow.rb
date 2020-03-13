class Arrow < ApplicationRecord
  belongs_to :user

  def self.by_user(user_id)
    Arrow.all.where(to_user_id: user_id).order("arrows.created_at DESC")
  end

  def self.by_id(arrow_id, user_id)
    Arrow.joins(:user).select("arrows.created_at, users.name, arrows.reason")
      .find_by(arrows: { id: arrow_id, to_user_id: user_id })
  end
end
