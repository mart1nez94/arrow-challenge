class ArrowsController < ApplicationController

  def index
    @arrows = Arrow.by_user(current_user.id) if user_signed_in?
  end
end
