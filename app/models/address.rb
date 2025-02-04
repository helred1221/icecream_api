# frozen_string_literal: true

# Address Model Class
class Address < ApplicationRecord
  belongs_to :user

  validates :street, :house_number, :neighborhood, :city, :zip_code, presence: true
end
