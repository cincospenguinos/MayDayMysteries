require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  valid_params = { user: { username: 'foo', password: 'hellothere', email_address: 'foo@biz.baz' } }

  test '#new is successful' do
    get new_user_url
    assert_response :success
  end

  test '#create creates from valid params' do
    assert_difference 'User.count' do
      post users_url, params: valid_params
    end
  end

  test '#create automatically logs in' do
    post users_url, params: valid_params
    assert_equal User.last.id, session[:user_id]
  end

  test '#create redirects to documents list' do
    skip 'Documents list needs to be implemented first'
    post users_url, params: valid_params
  end

  test '#create does not create a new user' do
    assert_no_difference 'User.count' do
      post users_url, params: { user: { username: 'foo', password: 'no', email_address: 'foo@biz.baz' } }
    end
  end
end
