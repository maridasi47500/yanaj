class CategoriesController < ApplicationController
  def show
    @category=Category.find_by_url(params[:name])
  end
end
