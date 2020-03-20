class Arrow < ApplicationRecord
  belongs_to :user

  def Arrow.get_by_user(user_id)
    all.where(to_user_id: user_id).order("arrows.created_at DESC")
  end

  def Arrow.get_by_id(arrow_id, user_id)
    joins(:user).select("arrows.created_at, users.name, arrows.reason")
      .find_by(arrows: { id: arrow_id, to_user_id: user_id })
  end

  def Arrow.insert(arrow_params)
    create!(arrow_params)
  end
end
