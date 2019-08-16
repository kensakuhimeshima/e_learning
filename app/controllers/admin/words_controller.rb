class Admin::WordsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
  end

  def new
    @category = Category.find(params[:category_id])
    @word = @category.words.build
    3.times { @word.choices.build }
  end

  def create
    @category = Category.find(params[:category_id])
    @word = @category.words.build(word_params)

    if @word.save
      flash[:success] = "Successfully created word"
      redirect_to admin_category_words_url
    else
      render 'new'
    end
  end
  
  private
  def word_params
    params.require(:word).permit(:content, choices_attributes: [:id, :content, :is_correct])
  end
end
