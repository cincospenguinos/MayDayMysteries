require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  include SessionsHelper

  test "#new loads properly" do
    get '/login'
    assert_response :success
  end

  test 'logging in takes you to the documents page' do
    skip 'Documents list must be completed first'
    valid_user = users(:one)
    post '/login', { username: valid_user.username, password: valid_user.password }
    assert_redirected_to 'foo'
  end

  test 'logging in sets a session' do
    valid_user = users(:one)
    post '/login', params: { username: valid_user.username, password: 'password' }
    assert logged_in?
  end

  test 'failed login redirects you to login page' do
    valid_user = users(:one)
    post '/login', params: { username: valid_user.username, password: 'nope' }
    assert_redirected_to '/login'
  end

  test 'failed login does not log you in' do
    valid_user = users(:one)
    post '/login', params: { username: valid_user.username, password: 'nope' }
    assert !logged_in?
  end

  test '#destroy logs the user out' do
    valid_user = users(:one)
    post '/login', params: { username: valid_user.username, password: 'password' }
    assert logged_in?
    delete '/login'
    assert !logged_in?
  end
end
