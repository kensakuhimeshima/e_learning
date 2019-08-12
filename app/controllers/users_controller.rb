class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(users_params)

    if @user.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(users_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
  def users_params
    params.require(:user).permit(:name, :email, :password, :password_comfirmation)
  end
end
