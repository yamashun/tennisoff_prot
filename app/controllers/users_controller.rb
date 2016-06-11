class UsersController < ApplicationController
  before_action :user_check, except: :show

  def show
    @user = User.find(params[:id])
    @hold_off_meetings = @user.off_meetings
    entries = @user.entries
    @entry_off_meetings = []

    entries.each do |entry|
      @entry_off_meetings << entry.off_meeting
    end
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = current_user
    if @user.update(update_params)
      @hold_off_meetings = @user.off_meetings
      redirect_to action: :show
    else
      render :edit
    end
  end

  def edit_password
  end

  def update_password
    if current_user.update_with_password(update_password_params)
      sign_in(current_user, bypass: true)
      @user = current_user
      flash.now[:notice] = "パスワードの変更に成功しました"
      render action: :show
    else
      redirect_to action: :edit_password
    end
  end

  private
  def update_params
    params.require(:user).permit(:email, :nickname, :area, :sex, :detail, :avatar)
  end

  def update_password_params
    params.require(:user).permit(:password, :password_confirmation, :current_password)
  end

  def user_check
    if user_signed_in?
      redirect_to root_path unless current_user == User.find(params[:id])
    else
      redirect_to root_path
    end
  end

end
