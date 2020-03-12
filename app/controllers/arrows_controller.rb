class ArrowsController < ApplicationController
  before_action :authenticate_user!

  def index
    @arrows = Arrow.by_user(current_user.id) if user_signed_in?
  end

  def show

  end
end
