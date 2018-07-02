require 'test_helper'

class WebhookEventsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get webhook_events_create_url
    assert_response :success
  end

  test "should get index" do
    get webhook_events_index_url
    assert_response :success
  end

end
