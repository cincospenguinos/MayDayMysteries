require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'valid users work' do
    valid_user = User.new(username: 'i_am_a_user', email_address: 'foo@bar.baz', password: 'hellothere')
    assert valid_user.valid?
  end

  test 'usernames have length of 30 chars' do
    invalid_user = User.new(username: '__this_is_more_than_thirty_chars__', email_address: 'foo@baz.biz', password: 'hellothere')
    assert !invalid_user.valid?
  end

  test 'usernames must have at least 3 chars' do
    invalid_user = User.new(username: 'no', email_address: 'foo@baz.biz', password: 'hellothere')
    assert !invalid_user.valid?
  end

  test 'username must exist' do
    invalid_user = User.new(email_address: 'foo@baz.biz', password: 'hellothere')
    assert !invalid_user.valid?
  end

  test 'username must only accept alphanumeric characters' do
    invalid_user = User.new(username: '<b>Bold!</b>', email_address: 'foo@biz.baz', password: 'yesitis')
    assert !invalid_user.valid?
  end

  test 'email address must be valid' do
    invalid_user = User.new(username: 'valid_username', email_address: 'not a valid email address', password: 'hellothere')
    assert !invalid_user.valid?
  end

  test 'email address must exist' do
    invalid_user = User.new(username: 'foo', password: 'password')
    assert !invalid_user.valid?
  end

  test 'password must be at least 8 characters' do
    invalid_user = User.new(username: 'foo', email_address: 'foo@biz.baz', password: 'no')
    assert !invalid_user.valid?
  end
end
