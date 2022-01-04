class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :check_user_role

  def index
    @students = Student.all
  end

  def show
    topics = Topic.all

    @part_1s = topics.reject { |t| t.part_1.empty? }
    @part_2s = topics.reject { |t| t.part_2.empty? }

    @practiseds = Practised.where(student: @student)
    @practised_ids = @practiseds.map(&:topic_id)
    @practised = Practised.new
    @users = User.all
  end

  def new
    @student = Student.new
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
    p = params.require(:student).permit(:name_zh, :name_en, :timezone, :onboarding, :notes)
    p[:timezone] = ActiveSupport::TimeZone::MAPPING[p[:timezone]]

    p
  end

  def set_student
    @student = Student.find(params[:id])
  end

  def check_user_role
    redirect_to root_path if current_user.no_role?
  end
end
