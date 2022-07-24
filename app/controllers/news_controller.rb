class NewsController < ApplicationController
  def show
  end
    def index
    @page=params[:page] ? params[:page].to_i : 1
    @news=News.searchall(params[:page],params[:thematique])
    end

end
