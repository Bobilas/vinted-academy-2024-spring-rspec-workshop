# frozen_string_literal: true

RSpec.describe Items::NsfwValidator do
  describe '#nsfw?' do
    it 'returns true when nsfw' do
      # TODO: write test
    end

    it 'returns false when sfw' do
      # TODO: write test
    end

    it 'BONUS 1: fix this failing test and change example description' do
      validator = described_class.new('Radioactive Balls')
      expect(validator.nsfw?).to be true
    end

    it 'BONUS 2: fix this failing test and change example description' do
      validator = described_class.new(nil)
      expect(validator.nsfw?).to be false
    end
  end

  it 'fails' do
    expect { 1 / 0 }.to raise_error(ZeroDivisionError)
  end
end
