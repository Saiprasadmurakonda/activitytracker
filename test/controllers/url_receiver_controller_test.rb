require "test_helper"

class UrlReceiverControllerTest < ActionDispatch::IntegrationTest
  test "should get receive_url" do
    get url_receiver_receive_url_url
    assert_response :success
  end
end
