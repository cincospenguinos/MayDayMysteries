require 'test_helper'

class DocumentTest < ActiveSupport::TestCase
  test 'name is required' do
    assert !Document.new(published: Date.today).valid?
  end

  test 'name is unique' do
    Document.create!(name: '81-may-1.jpg', published: Date.today)
    assert !Document.new(name: '81-may-1.jpg', published: Date.today).valid?
  end

  test 'name matches format' do
    assert !Document.new(name: 'not valid', published: Date.today).valid?
  end

  test 'published date is required' do
    assert !Document.new(name: '81-may-1.jpg').valid?
  end
end
