# frozen_string_literal: true

RSpec.describe Items::NsfwValidator do
  describe '#nsfw?' do
    # TODO: extract `validator` and `item_name` using let

    context 'when nsfw lowercase' do
      it 'returns true' do
        item_name = 'balls'
        validator = described_class.new(item_name)
        expect(validator.nsfw?).to be true
      end
    end

    context 'when nsfw uppercase' do
      it 'returns true' do
        item_name = 'Radioactive Balls'
        validator = described_class.new(item_name)
        expect(validator.nsfw?).to be true
      end
    end

    context 'when sfw' do
      it 'returns false' do
        item_name = 'This is completely safe'
        validator = described_class.new(item_name)
        expect(validator.nsfw?).to be false
      end
    end

    context 'when nil' do
      it 'returns false' do
        item_name = nil
        validator = described_class.new(item_name)
        expect(validator.nsfw?).to be false
      end
    end
  end
end
