# frozen_string_literal: true

# Address Model Class
class Address < ApplicationRecord
  has_many :users
end
