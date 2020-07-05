unless Rails.env.production?
  # Create a couple users for testing purposes
  User.create(username: 'admin', email_address: 'admin@example.com', password: 'password')
  User.create(username: 'user', email_address: 'user@example.com', password: 'password')
end

# Create documents matching each image stored in the documents directory
documents_dir = Rails.root.join('app', 'assets', 'images', 'documents')

Dir["#{documents_dir}/**.jpg"].each do |file_name|
  document_name = file_name.gsub(documents_dir.to_s + '/', '')
  date_str = document_name.gsub('.jpg', '')
  date_published = Date.strptime(date_str, '%y-%b-%d')

  document = Document.new(name: document_name, published: date_published)
  document.save! if document.valid?
end