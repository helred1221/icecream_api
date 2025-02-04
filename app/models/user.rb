# frozen_string_literal: true

# User Model Class
class User < ApplicationRecord
  belongs_to :address
  has_many :sale, dependent: :destroy
  has_many :user_rate_product

  validates :name, :email, :password, :role, presence: true
  validates :email, uniqueness: true

  accepts_nested_attributes_for :address, allow_destroy: true
end
