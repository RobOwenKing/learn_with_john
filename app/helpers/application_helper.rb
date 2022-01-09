module ApplicationHelper
  def find_practised(practiseds, topic)
    practiseds[practiseds.find_index { |p| p.topic_id == topic.id }]
  end
end
