class UsersController < ApplicationController
  before_action :user_judge, only: [:update]

  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    if @user.update(user_params)
      session[:user_id] = @user.id
      redirect_to user_path(@user.id), notice: "プロフィールを編集しました！"
    else
      render :edit
    end
  end
  def show
    @user = User.find(params[:id])
  end
  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :user_image)
  end

  def user_judge
    @user = User.find(params[:id])
    unless current_user && @user.id == current_user.id
      redirect_to root_path, notice: '他人のプロフィールは編集できません！'
    end
  end
end
