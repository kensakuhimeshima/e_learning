class LessonsController < ApplicationController
  def create
    @lesson = Lesson.find_by(category_id:params[:category_id], user_id: current_user.id)
    unless @lesson
      @lesson = Lesson.new(lesson_params)
      if @lesson.save
        redirect_to new_lesson_answer_url(@lesson)
      end
    else
      @lesson.destroy
    end
  end

  def show
    @lesson = Lesson.find(params[:id])
    @result = @lesson.correct_answers.count
  end

  private
  def lesson_params
    params.permit(:category_id).merge(user_id: current_user.id)
  end
end
