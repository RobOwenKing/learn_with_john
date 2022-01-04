class TopicsController < ApplicationController
  before_action :set_topic, only: [:edit, :update, :destroy]
  before_action :check_user_role

  def index
    topics = Topic.all

    @part_1s = topics.reject { |t| t.part_1.empty? }
    @part_2s = topics.reject { |t| t.part_2.empty? }
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.save

    redirect_to topics_path
  end

  def edit
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
    params.require(:topic).permit(:name, :part_1, :part_2, :part_2_hints, :part_3)
  end

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def check_user_role
    redirect_to root_path if current_user.no_role?
  end
end
