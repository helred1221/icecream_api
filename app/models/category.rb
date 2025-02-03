# frozen_string_literal: true

# Category Model Class
class Category < ApplicationRecord
  has_many :products, dependent: :destroy
end
