class EventsController < ApplicationController
  def show
@event=Event.find_by_url(params[:title])
  end
    def index
    redirect_to agenda_path if params[:page] == "1"
    @page=params[:page] ? params[:page].to_i : 1
    @events=Event.searchall(params[:page])
    end
end
