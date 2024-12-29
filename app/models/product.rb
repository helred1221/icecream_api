class Product < ApplicationRecord
  belongs_to :category
  has_many :user_rate_product
end
