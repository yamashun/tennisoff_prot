class EntriesController < ApplicationController
  before_action :check_before_create, only: :create
  before_action :check_before_destroy, only: :destroy

  def create
    @entry = Entry.create(create_params)

    # respond_to do |format|
    #   format.html { redirect_to controller: :off_meetings, action: :show, id: params[:off_meeting_id], notice: 'オフ会への参加申し込みました' }
    # end

    flash.keep(:notice)
    flash[:notice] = 'オフ会への参加申し込みました'
    redirect_to controller: :off_meetings, action: :show, id: params[:off_meeting_id]
  end

  def destroy
    # binding.pry
    Entry.find(params[:id]).destroy

    flash.keep(:alert)
    flash[:alert] = 'オフ会への参加を取り消しました。'
    redirect_to controller: :off_meetings, action: :show, id: params[:off_meeting_id]
  end

  private
    def create_params
      params.permit(:off_meeting_id).merge(user_id: current_user.id)
    end

    def check_before_create
      # binding.pry
      # entry = Entry.find(params[:off_meeting_id:)
      redirect_to root_path unless user_signed_in? && current_user.id != OffMeeting.find(params[:off_meeting_id]).user_id
    end

    def check_before_destroy
      # binding.pry
      #①ログインしているか②ロログイン中のユーザーと削除しようとするエントリーのユーザーIDが一致するか
      redirect_to root_path unless user_signed_in? && current_user.id == Entry.find(params[:id]).user_id
    end


end