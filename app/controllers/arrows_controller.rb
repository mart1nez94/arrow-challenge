class ArrowsController < ApplicationController
  before_action :authenticate_user!

  def index
    @arrows = Arrow.by_user(current_user.id)
    @arrow = Arrow.new
  end

  def show
    @arrow = Arrow.by_id(params[:id], current_user.id)
  end

  def create

  end
end
