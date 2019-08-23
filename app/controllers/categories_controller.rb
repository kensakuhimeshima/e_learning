class CategoriesController < ApplicationController
  def index
    @categories = Category.paginate(page: params[:page], per_page: 6)
    @lesson = Lesson.new
    @user = User.find(current_user.id)

    if params[:learned] == "1"
      @categories = @user.categories.paginate(page: params[:page], per_page:10)
    elsif params[:learned] == "0"
      @categories = @categories.where.not(id:@user.category_ids).paginate(page: params[:page], per_page:10)
    end
  end
end
