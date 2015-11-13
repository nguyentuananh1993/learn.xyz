class GoalsController < ApplicationController
  before_action :set_user, only: [:new, :create]
  
  def index
  end

  def new
    @goal = @user.goals.new
  end
  
  def create
    @goal = Goal.new goal_params
    @goal.user_id = @user.id
    if @goal.save
      flash[:success] = "Success ><<><"
      redirect_to @user
    else
      render :new
    end
  end
  
  private
  def set_user
    @user = current_user
  end
  
  def goal_params
    params.require(:goal).permit :words, :deadline
  end

end
