class StudentsController < ApplicationController
  before_action :user_role?, only: %i[show edit update]
  before_action :user_admin?, only: %i[index new create destroy]

  before_action :set_student, only: %i[show edit update destroy]

  def index
    @students = Student.all.order(:name_en)
  end

  def show
    topics = Topic.where { |t| t.category.current }.order(:name)

    @part_1s = topics.reject { |t| t.part_1.empty? }
    @part_2s = topics.reject { |t| t.part_2.empty? }

    @practiseds = Practised.where(student: @student)
    @practised_ids = @practiseds.map(&:topic_id)
    @practised = Practised.new
    @users = User.all.order(:name)
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
    if current_user.admin?
      params.require(:student).permit(:name_zh, :name_en, :timezone, :onboarding, :notes, :app, user_ids: [])
    else
      params.require(:student).permit(:name_zh, :name_en, :timezone, :onboarding, :notes, :app)
    end
  end

  def set_student
    @student = Student.find(params[:id])
  end

  def user_role?
    redirect_to root_path if current_user.no_role?
  end

  def user_admin?
    redirect_to root_path unless current_user.admin?
  end
end
