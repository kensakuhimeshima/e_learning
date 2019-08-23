class WordsController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @answers = @user.answers.paginate(page: params[:page],per_page: 10)
  end
end
