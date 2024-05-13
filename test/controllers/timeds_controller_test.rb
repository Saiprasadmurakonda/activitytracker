require "test_helper"

class TimedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @timed = timeds(:one)
  end

  test "should get index" do
    get timeds_url
    assert_response :success
  end

  test "should get new" do
    get new_timed_url
    assert_response :success
  end

  test "should create timed" do
    assert_difference("Timed.count") do
      post timeds_url, params: { timed: { timed_site: @timed.timed_site, timeinmin: @timed.timeinmin } }
    end

    assert_redirected_to timed_url(Timed.last)
  end

  test "should show timed" do
    get timed_url(@timed)
    assert_response :success
  end

  test "should get edit" do
    get edit_timed_url(@timed)
    assert_response :success
  end

  test "should update timed" do
    patch timed_url(@timed), params: { timed: { timed_site: @timed.timed_site, timeinmin: @timed.timeinmin } }
    assert_redirected_to timed_url(@timed)
  end

  test "should destroy timed" do
    assert_difference("Timed.count", -1) do
      delete timed_url(@timed)
    end

    assert_redirected_to timeds_url
  end
end
