class PractisedsController < ApplicationController
  before_action :check_user_role

  def create
    @practised = Practised.new(practised_params)
    @student = Student.find(params[:student_id])
    @practised.save

    redirect_to student_path(@student)
  end

  def destroy
    @practised = Practised.find(params[:id])
    @student = @practised.student
    @practised.destroy

    redirect_to student_path(@student)
  end

  private

  def practised_params
    params[:practised].permit(:user_id, :student_id, :topic_id)
  end

  def check_user_role
    redirect_to root_path if current_user.no_role?
  end
end
