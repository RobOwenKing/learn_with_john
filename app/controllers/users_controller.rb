class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :check_user_admin, only: [:index, :edit, :update]

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
    @user.update(user_params)

    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:role)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def check_user_admin
    redirect_to root_path unless current_user.admin?
  end
end
