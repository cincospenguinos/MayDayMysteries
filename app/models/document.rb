class Document < ApplicationRecord
  NAME_REGEX = /\A[0-9]+-[a-z]+-[0-9]+\.(jpg|jpeg)\z/.freeze
  validates :name, presence: true, uniqueness: true, format: { with: NAME_REGEX }
  validates :published, presence: true
end
