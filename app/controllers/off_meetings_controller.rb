class OffMeetingsController < ApplicationController
  before_action :set_off_meeting, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]

  # GET /off_meetings
  # GET /off_meetings.json
  def index
    @off_meetings = OffMeeting.all.order("updated_at DESC").page(params[:page]).per(5)
    @search = OffMeeting.search(params[:q])
  end

  # GET /off_meetings/1
  # GET /off_meetings/1.json
  def show
    #参加、キャンセルボタンの制御のために取得。ユーザーログインしていない場合は検索しない
    @entry = Entry.find_by(user_id: current_user.id, off_meeting_id: @off_meeting.id) if user_signed_in?

    @entries = @off_meeting.entries

    @question = Question.new
    @questions = @off_meeting.questions.includes(:answers)
    @off_meeting.level = @off_meeting.level_convert

  end

  # GET /off_meetings/new
  def new
    @off_meeting = OffMeeting.new
  end

  # GET /off_meetings/1/edit
  def edit
    off_meeting = OffMeeting.find(params[:id])
    unless current_user.id == off_meeting.user_id
      redirect_to root_path
      return
    end
  end

  # POST /off_meetings
  # POST /off_meetings.json
  def create
    @off_meeting = OffMeeting.new(off_meeting_params)

    respond_to do |format|
      if @off_meeting.save
        format.html { redirect_to @off_meeting, notice: 'オフ会を登録しました。' }
        format.json { render :show, status: :created, location: @off_meeting }
      else
        format.html { render :new }
        format.json { render json: @off_meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /off_meetings/1
  # PATCH/PUT /off_meetings/1.json
  def update
    respond_to do |format|
      if @off_meeting.update(off_meeting_params)
        format.html { redirect_to @off_meeting, notice: 'Off meeting was successfully updated.' }
        format.json { render :show, status: :ok, location: @off_meeting }
      else
        format.html { render :edit }
        format.json { render json: @off_meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /off_meetings/1
  # DELETE /off_meetings/1.json
  def destroy
    @off_meeting.destroy
    respond_to do |format|
      format.html { redirect_to off_meetings_url, notice: 'Off meeting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    @search = OffMeeting.search(params[:q])
    @off_meetings = @search.result.page(params[:page]).per(5)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_off_meeting
      @off_meeting = OffMeeting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def off_meeting_params
      params.require(:off_meeting).permit(:day, :address, :level, :detail, :summary, :num_of_persons).merge(user_id: current_user.id)
    end
end
