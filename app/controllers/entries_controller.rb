class EntriesController < ApplicationController
  def create
    @entry = Entry.create(create_params)
  end

  def destroy
    Entry.find(params[:id]).destroy
  end

  private
    def create_params
      params.permit(:off_meeting_id).merge(user_id: current_user.id)
    end


end