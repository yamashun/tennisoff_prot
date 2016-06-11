class QuestionsController < ApplicationController

  before_action :authenticate_user!
  # def new
  #   @question = Question.new
  # end

  def create
    @question = Question.create(question_params)
    redirect_to controller: 'off_meetings', action: 'show', id: params[:off_meeting_id]
  end

  def update
  end

  private
  def question_params
    params.require(:question).permit(:question).merge(user_id: current_user.id, off_meeting_id: params[:off_meeting_id])
  end
end
