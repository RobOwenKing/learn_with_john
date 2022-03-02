class UsersController < ApplicationController
  before_action :user_admin?, only: %i[index edit update]

  before_action :set_user, only: %i[show edit update]

  def index
    @users = User.all.order(:name)
  end

  def show
    @students = @user.students.order(:name_en)
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

  def user_admin?
    redirect_to root_path unless current_user.admin?
  end
end
