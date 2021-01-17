class Image < ApplicationRecord
  validates :url, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true
end
