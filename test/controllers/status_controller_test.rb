require 'test_helper'

class StatusControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    get '/api/v1/status', as: :json
    assert_response :success
  end
end
