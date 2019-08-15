class Admin::WordsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
  end

  def new
  end
end
