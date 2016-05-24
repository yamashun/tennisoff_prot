require 'test_helper'

class OffMeetingsControllerTest < ActionController::TestCase
  setup do
    @off_meeting = off_meetings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:off_meetings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create off_meeting" do
    assert_difference('OffMeeting.count') do
      post :create, off_meeting: { address: @off_meeting.address, day: @off_meeting.day, detail: @off_meeting.detail, level: @off_meeting.level }
    end

    assert_redirected_to off_meeting_path(assigns(:off_meeting))
  end

  test "should show off_meeting" do
    get :show, id: @off_meeting
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @off_meeting
    assert_response :success
  end

  test "should update off_meeting" do
    patch :update, id: @off_meeting, off_meeting: { address: @off_meeting.address, day: @off_meeting.day, detail: @off_meeting.detail, level: @off_meeting.level }
    assert_redirected_to off_meeting_path(assigns(:off_meeting))
  end

  test "should destroy off_meeting" do
    assert_difference('OffMeeting.count', -1) do
      delete :destroy, id: @off_meeting
    end

    assert_redirected_to off_meetings_path
  end
end
