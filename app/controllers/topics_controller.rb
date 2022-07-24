class TopicsController < ApplicationController
  def show
    @topic=Topic.find_by_url(params[:name])
  end
end
