class AnswersController < ApplicationController

  before_action :authenticate_user!

  def create
    Answer.create(answer_params)
    redirect_to controller: 'off_meetings', action: 'show', id: params[:off_meeting_id]
  end

  private
  def answer_params
    params.permit(:answer).merge(user_id: current_user.id, question_id: params[:question_id])
  end

end
