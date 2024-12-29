# frozen_string_literal: true

# Product Model Class
class Product < ApplicationRecord
  belongs_to :category
  has_many :user_rate_product
  has_many :sale_products
end
