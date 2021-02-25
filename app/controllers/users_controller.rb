class UsersController < ApplicationController
  # before_action :preedit,only: [:edit]
  def show
    @book2=Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def index
    @book2=Book.new
    @user=current_user
    @users=User.all
  end

  def edit
    @user=User.find(params[:id])
if @user != current_user
  redirect_to user_path(current_user)
end
  end

  def preedit
    @user=User.find(params[:id])
if @user != current_user
  redirect_to user_path(current_user)
end
  end

  def update
    @user=current_user
    @user.update(user_params)
    if @user.update(user_params)
      flash[:notice]="User was successfully Update"
      redirect_to user_path(@user.id)
    else
      render :edit
    end

  end

    private

  def user_params
    params.require(:user).permit(:name, :profile_image,:introduction)
  end

end
