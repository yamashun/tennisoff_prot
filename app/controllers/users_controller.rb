class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
    @off_meetings = current_user.off_meetings
  end
end
