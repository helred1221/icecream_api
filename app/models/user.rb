# frozen_string_literal: true

# User Model Class
class User < ApplicationRecord
  has_many :addresses, dependent: :destroy
  has_many :sales, dependent: :destroy
  has_many :rates, dependent: :destroy

  validates :name, :email, :password, :role, presence: true
  validates :email, uniqueness: true

  accepts_nested_attributes_for :address, allow_destroy: true
end
