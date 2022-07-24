class PlansController < ApplicationController
  def show
@plan=Plan.find_by_url(params[:title])
  end
end
