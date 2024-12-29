# frozen_string_literal: true

# Sale Model Class
class Sale < ApplicationRecord
  belongs_to :user
  has_many :sale_products
end
