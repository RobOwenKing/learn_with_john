class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]

  before_action :user_role?, only: %i[index show]
  before_action :user_admin?, only: %i[new create edit update destroy]

  def index
    categories = Category.all.order(name: :desc)

    @currents = categories.select(&:current)
    @olds = categories.reject(&:current)
  end

  def show
    topics = Topic.where(category: @category).order(:name)

    @part_1s = topics.reject { |t| t.part_1.empty? }
    @part_2s = topics.reject { |t| t.part_2.empty? }
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path
    else
      render :edit
    end
  end

  def destroy
    @category.destroy

    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name, :current, :colour)
  end

  def set_category
    @category = Category.find(params[:id])
  end

  def user_role?
    redirect_to root_path if current_user.no_role?
  end

  def user_admin?
    redirect_to root_path unless current_user.admin?
  end
end
