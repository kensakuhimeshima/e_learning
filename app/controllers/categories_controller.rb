class CategoriesController < ApplicationController
  def index
    @categories = Category.paginate(page: params[:page], per_page: 6)
  end

  private
  def categories_params
    params.require(:category).permit(:title, :description)
  end
end
