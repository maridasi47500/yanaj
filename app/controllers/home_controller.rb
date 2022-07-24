class HomeController < ApplicationController
  def index
    @news=News.welcomepage
    @events=Event.welcomepage
  end
    def search
        @news=News.search(params[:search_key])
        @events=Event.search(params[:search_key])
        @plans=Plan.search(params[:search_key])
        @categories=Category.search(params[:search_key])
        @pages=Pagesite.search(params[:search_key])
        @all=[@news,@events,@plans,@categories,@pages].map(&:to_a).sum
    end
    def raisenotfound
render file: "#{Rails.root}/public/404", status: :not_found,layout: false
    end
end
