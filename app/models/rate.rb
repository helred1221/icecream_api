# frozen_string_literal: true

# Rate Model Class
class Rate < ApplicationRecord
  has_many :user_rate_product
end
