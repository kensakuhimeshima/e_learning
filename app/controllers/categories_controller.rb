class CategoriesController < ApplicationController
  def index
    @categories = Category.paginate(page: params[:page], per_page: 6)
    @lesson = Lesson.new
    @user = User.find(current_user.id)
  end
end
