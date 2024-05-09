# frozen_string_literal: true

module Items::NsfwKeywords
  KEYWORDS = %w(slippery flammable explosive radioactive balls).freeze

  def self.run
    KEYWORDS.sample(3)
  end
end
