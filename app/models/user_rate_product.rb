# frozen_string_literal: true

# User Rate Product Model Class
class UserRateProduct < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :rate
end
