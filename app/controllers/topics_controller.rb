class TopicsController < ApplicationController
  before_action :set_topic, only: [:edit, :update, :destroy]

  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new # needed to instantiate the form_for
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.save

    redirect_to topic_path(@topic)
  end

  def edit
  end

  def update
    @topic.update(topic_params)

    redirect_to topic_path(@topic)
  end

  def destroy
    @topic.destroy

    redirect_to topics_path
  end

  private

  def topic_params
    params.require(:topic).permit(:name, :is_part_1, :questions, :follow_ups)
  end

  def set_topic
    @topic = Topic.find(params[:id])
  end
end
