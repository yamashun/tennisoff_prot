class UsersController < ApplicationController
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
    @user = current_user.update(update_params)
    @hold_off_meetings = current_user.off_meetings
    redirect_to action: :show
  end

  private
  def update_params
    params.require(:user).permit(:email, :nickname, :area, :sex, :detail, :avatar)
  end

end
