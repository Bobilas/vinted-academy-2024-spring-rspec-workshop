# frozen_string_literal: true

class Items::NsfwValidator
  attr_reader :item_name

  def initialize(item_name)
    @item_name = item_name&.downcase
  end

  def nsfw?
    return @nsfw if defined?(@nsfw)
    return @nsfw = false if item_name.blank?

    @nsfw = keywords.any? do |keyword|
      item_name.include?(keyword)
    end
  end

  def validate
    raise StandardError, 'item is nsfw' if nsfw?
  end

  private

  def keywords
    @keywords ||= Items::NsfwKeywords.run
  end
end
