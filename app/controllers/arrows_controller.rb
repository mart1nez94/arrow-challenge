require 'redcarpet/compat'

class ArrowsController < ApplicationController
  before_action :authenticate_user!

  def index
    @arrows = Arrow.get_by_user(current_user.id)
  end

  def show
    @arrow = Arrow.get_by_id(params[:id], current_user.id)
  end

  def create
    @arrow = Arrow.insert(arrow_params)
    if @arrow.save
      redirect_to root_path
      flash[:success] = "Arrow sent!"
    end
  end

  private 

  def arrow_params
    params.require(:arrow).permit(:to_user_id, :reason, :user_id)
  end
end
