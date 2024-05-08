# frozen_string_literal: true

class Item < ApplicationRecord
  scope :for_sale, -> { where(is_sold: false) }

  belongs_to :user
end
