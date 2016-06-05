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
    @user = current_user
    if @user.update(update_params)
      @hold_off_meetings = @user.off_meetings
      redirect_to action: :show
    else
      # binding.pry
      render :edit
    end

    # respond_to do |format|
    #   if current_user.update(update_params)
    #     format.html { redirect_to , notice: 'ユーザー情報を更新しました。' }
    #     format.json { render :show, status: :ok, location: current_user }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: current_user.errors, status: :unprocessable_entity }
    #   end
    # end

  end

  private
  def update_params
    params.require(:user).permit(:email, :nickname, :area, :sex, :detail, :avatar)
  end

end
