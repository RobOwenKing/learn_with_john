class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = Student.all
  end

  def show
    topics = Topic.all

    @part_1s = topics.reject { |t| t.part_1.empty? }
    @part_2s = topics.reject { |t| t.part_2.empty? }
  end

  def new
    @student = Student.new # needed to instantiate the form_for
  end

  def create
    @student = Student.new(student_params)
    @student.save

    redirect_to student_path(@student)
  end

  def edit
  end

  def update
    @student.update(student_params)

    redirect_to student_path(@student)
  end

  def destroy
    @student.destroy

    redirect_to students_path
  end

  private

  def student_params
    params.require(:student).permit(:name_zh, :name_en, :onboarding, :notes)
  end

  def set_student
    @student = Student.find(params[:id])
  end
end
