class Admin::CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(categories_params)
    
    if @category.save
      flash[:success] = "Category successfully created"
      redirect_to admin_categories_url
    else
      render 'new'
    end 
  end

  def index
  end

  private
  def categories_params
    params.require(:category).permit(:title, :description)
  end
end
