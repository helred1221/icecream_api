# frozen_string_literal: true

# Sale Product Model Class
class SaleProduct < ApplicationRecord
  belongs_to :sale
  belongs_to :product

  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :product_id, presence: true
end
