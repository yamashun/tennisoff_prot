class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
    @off_meetings = current_user.off_meetings
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = current_user.update(update_params)
    @off_meetings = current_user.off_meetings
    redirect_to action: :show
  end

  private
  def update_params
    params.require(:user).permit(:email, :nickname, :area, :sex, :detail, :avatar)
  end

end
