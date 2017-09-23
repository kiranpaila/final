require 'test_helper'

class EventcoordinatorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @eventcoordinator = eventcoordinators(:one)
  end

  test "should get index" do
    get eventcoordinators_url
    assert_response :success
  end

  test "should get new" do
    get new_eventcoordinator_url
    assert_response :success
  end

  test "should create eventcoordinator" do
    assert_difference('Eventcoordinator.count') do
      post eventcoordinators_url, params: { eventcoordinator: { Contact_no: @eventcoordinator.Contact_no, Email: @eventcoordinator.Email, Event: @eventcoordinator.Event, Name: @eventcoordinator.Name, Name: @eventcoordinator.Name } }
    end

    assert_redirected_to eventcoordinator_url(Eventcoordinator.last)
  end

  test "should show eventcoordinator" do
    get eventcoordinator_url(@eventcoordinator)
    assert_response :success
  end

  test "should get edit" do
    get edit_eventcoordinator_url(@eventcoordinator)
    assert_response :success
  end

  test "should update eventcoordinator" do
    patch eventcoordinator_url(@eventcoordinator), params: { eventcoordinator: { Contact_no: @eventcoordinator.Contact_no, Email: @eventcoordinator.Email, Event: @eventcoordinator.Event, Name: @eventcoordinator.Name, Name: @eventcoordinator.Name } }
    assert_redirected_to eventcoordinator_url(@eventcoordinator)
  end

  test "should destroy eventcoordinator" do
    assert_difference('Eventcoordinator.count', -1) do
      delete eventcoordinator_url(@eventcoordinator)
    end

    assert_redirected_to eventcoordinators_url
  end
end
