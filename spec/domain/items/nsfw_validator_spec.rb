# frozen_string_literal: true

RSpec.describe Items::NsfwValidator do
  let(:validator) { described_class.new(item_name) }

  describe '#nsfw?' do
    # TODO: use subject and convert example groups to one-liners

    context 'when nsfw lowercase' do
      let(:item_name) { 'balls' }

      it 'returns true' do
        expect(validator.nsfw?).to be true
      end
    end

    context 'when nsfw uppercase' do
      let(:item_name) { 'Radioactive Balls' }

      it 'returns true' do
        expect(validator.nsfw?).to be true
      end
    end

    context 'when sfw' do
      let(:item_name) { 'This is completely safe' }

      it 'returns false' do
        expect(validator.nsfw?).to be false
      end
    end

    context 'when nil' do
      let(:item_name) { nil }

      it 'returns false' do
        expect(validator.nsfw?).to be false
      end
    end
  end

  describe '#validate' do
    # TODO: use subject and verify if error is raised or not
  end
end
