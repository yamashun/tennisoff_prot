class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
    @hold_off_meetings = current_user.off_meetings
    entries = current_user.entries
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
    # @entry_off_meetings = current_user.entries.off_meeting
    redirect_to action: :show
  end

  private
  def update_params
    params.require(:user).permit(:email, :nickname, :area, :sex, :detail, :avatar)
  end

end
