require 'redcarpet/compat'

class ArrowsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(current_user.id)
    @arrows = @user.arrows.order(created_at: :desc)
  end

  def show
    @arrow = Arrow.joins("INNER JOIN users ON users.id = arrows.from_user_id")
      .select("arrows.created_at, users.name, arrows.reason")
      .find_by(arrows: { id: params[:id] })
  end

  def create
    @arrow = Arrow.create!(arrow_params)
    if @arrow.save
      redirect_to root_path
      flash[:success] = "Arrow sent!"
    end
  end

  private 

  def arrow_params
    params.require(:arrow).permit(:user_id, :reason, :from_user_id)
  end
end
