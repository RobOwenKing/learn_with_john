class TopicsController < ApplicationController
  before_action :set_topic, only: %i[edit update destroy]

  before_action :user_role?, only: %i[index]
  before_action :user_admin?, only: %i[new create edit update destroy]

  def index
    @topics = Topic.all.order(:name)

    @part_1s = @topics.reject { |t| t.part_1.empty? }
    @part_2s = @topics.reject { |t| t.part_2.empty? }
  end

  def new
    @topic = Topic.new
    @categories = Category.all.order(name: :desc)
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.save

    redirect_to topics_path
  end

  def edit
    @categories = Category.all.order(name: :desc)
  end

  def update
    @topic.update(topic_params)

    redirect_to topics_path
  end

  def destroy
    @topic.destroy

    redirect_to topics_path
  end

  private

  def topic_params
    params.require(:topic).permit(:name, :category_id, :part_1, :part_2, :part_2_hints, :part_3)
  end

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def user_role?
    redirect_to root_path if current_user.no_role?
  end

  def user_admin?
    redirect_to root_path unless current_user.admin?
  end
end
