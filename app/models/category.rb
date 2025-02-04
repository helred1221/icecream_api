# frozen_string_literal: true

# Category Model Class
class Category < ApplicationRecord
  has_many :products, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
end
