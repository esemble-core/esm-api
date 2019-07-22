require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  

  test "should get index" do
    get url_for([:api, :v1, @user]), as: :json
    assert_response :success
  end

  #test "should create user" do
  #  assert_difference('User.count') do
  #    post 'url_for([:api, :v1, @user])', params: { user: { eth_addr: @user.eth_addr, id: @user.id, name: @user.name } }, as: :json
  #  end

  #  assert_response 201
  #end

  test "should show user" do
    get url_for([:api, :v1, @user]), as: :json
    assert_response :success
  end

  test "should update user" do
    patch url_for([:api, :v1, @user]), params: { user: { eth_addr: @user.eth_addr, id: @user.id, name: @user.name, email: @user.email } }, as: :json
    assert_response 200
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete url_for([:api, :v1, @user]), as: :json
    end

    assert_response 204
  end
end
