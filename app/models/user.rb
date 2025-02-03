# frozen_string_literal: true

# User Model Class
class User < ApplicationRecord
  belongs_to :address
  has_many :sale, dependent: :destroy
  has_many :user_rate_product
end
