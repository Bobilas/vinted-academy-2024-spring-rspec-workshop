# frozen_string_literal: true

class User < ApplicationRecord
  scope :verified, -> { where(is_verified: true) }

  has_many :items, dependent: :destroy
end
