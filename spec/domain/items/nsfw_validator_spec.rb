# frozen_string_literal: true

RSpec.describe Items::NsfwValidator do
  let(:validator) { described_class.new(item_name) }

  describe '#nsfw?' do
    subject { validator.nsfw? }

    context 'when nsfw lowercase' do
      let(:item_name) { 'balls' }

      it { is_expected.to be true }
    end

    context 'when nsfw uppercase' do
      let(:item_name) { 'Radioactive Balls' }

      it { is_expected.to be true }
    end

    context 'when sfw' do
      let(:item_name) { 'This is completely safe' }

      it { is_expected.to be false }
    end

    context 'when nil' do
      let(:item_name) { nil }

      it { is_expected.to be false }
    end
  end

  describe '#validate' do
    subject { validator.validate }

    context 'when nsfw lowercase' do
      let(:item_name) { 'balls' }

      it 'raises error' do
        expect { subject }.to raise_error(StandardError).with_message('item is nsfw')
      end
    end

    context 'when nsfw uppercase' do
      let(:item_name) { 'Radioactive Balls' }

      it 'raises error' do
        expect { subject }.to raise_error(StandardError).with_message('item is nsfw')
      end
    end

    context 'when sfw' do
      let(:item_name) { 'This is completely safe' }

      it 'raises error' do
        expect { subject }.not_to raise_error
      end
    end

    context 'when nil' do
      let(:item_name) { nil }

      it 'raises error' do
        expect { subject }.not_to raise_error
      end
    end
  end
end
