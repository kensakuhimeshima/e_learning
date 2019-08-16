class Admin::WordsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @words = @category.words
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

  def edit
    @word = Word.find(params[:id])
    @category = Category.find(params[:category_id])
  end

  def update
    @word= Word.find(params[:id])
    
    if @word.update(word_params)
      flash[:success] = "Word successfully updated"
      redirect_to admin_category_words_url
    else
      render 'edit'
    end
  end

  def destroy
    @word = Word.find(params[:id])
    @word.destroy

    redirect_to admin_category_words_url
  end
  
  private
  def word_params
    params.require(:word).permit(:content, choices_attributes: [:id, :content, :is_correct])
  end
end
