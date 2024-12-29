# frozen_string_literal: true

# Sale Product Model Class
class SaleProduct < ApplicationRecord
  belongs_to :sale
  belongs_to :product
end
