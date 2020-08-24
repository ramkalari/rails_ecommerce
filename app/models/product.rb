class Product < ApplicationRecord
  validates :title, :description, :image_url, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true
  validates :title, length: {minimum: 10}
end


