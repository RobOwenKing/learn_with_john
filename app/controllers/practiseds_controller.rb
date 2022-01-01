class PractisedsController < ApplicationController
  def create
    @practised = Practised.new(practiced_params)
    @student = Student.find(params[:student_id])
    @practised.save

    redirect_to student_path(@student)
  end

  def destroy
    @practised = Practised.find(params[:id])
    @student = Student.find(params[:student_id])
    @practised.destroy

    redirect_to student_path(@student)
  end

  private

  def practiced_params
    params.permit(:user_id, :student_id, :topic_id)
  end
end
