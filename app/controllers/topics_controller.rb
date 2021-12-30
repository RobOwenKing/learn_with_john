class TopicsController < ApplicationController
  before_action :set_topic, only: [:edit, :update, :destroy]

  def index
    topics = Topic.all

    @part_1s = topics.reject { |t| t.part_1.empty? }
    @part_2s = topics.reject { |t| t.part_2.empty? }
  end

  def new
    @topic = Topic.new # needed to instantiate the form_for
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
end
