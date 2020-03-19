require 'redcarpet/compat'

class ArrowsController < ApplicationController
  before_action :authenticate_user!

  def index
    @arrows = Arrow.get_by_user(current_user.id)
    @arrow = Arrow.new
  end

  def show
    @arrow = Arrow.get_by_id(params[:id], current_user.id)
  end

  def create
    Arrow.insert(arrow_params)
  end

  private 

  def arrow_params
    params.require(:arrow).permit(:to_user_id, :reason, :user_id)
  end
end
