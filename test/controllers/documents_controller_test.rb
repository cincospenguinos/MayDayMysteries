require 'test_helper'

class DocumentsControllerTest < ActionDispatch::IntegrationTest
  test '#show responds okay with valid ID' do
    get document_url(Document.last.id)
    assert_response :success
  end

  test '#show responds with 404 without a valid ID' do
    get document_url(12)
    assert_response :not_found
  end
end
