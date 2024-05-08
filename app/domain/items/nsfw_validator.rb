# frozen_string_literal: true

class Items::NsfwValidator
  KEYWORDS = %w(slippery flammable explosive radioactive balls).freeze

  attr_reader :item_name

  def initialize(item_name)
    @item_name = item_name&.downcase
  end

  def nsfw?
    return @nsfw if defined?(@nsfw)
    return @nsfw = false if item_name.blank?

    @nsfw = KEYWORDS.any? do |keyword|
      item_name.include?(keyword)
    end
  end

  def validate
    raise StandardError, 'item is nsfw' if nsfw?
  end
end
