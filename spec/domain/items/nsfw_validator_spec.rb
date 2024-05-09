# frozen_string_literal: true

RSpec.describe Items::NsfwValidator do
  let(:validator) { described_class.new(item_name) }
  let(:keywords) { %w(explosive balls) }

  before { allow(Items::NsfwKeywords).to receive(:run).and_return(keywords) }

  describe '#nsfw?' do
    subject { validator.nsfw? }

    context 'when nsfw' do
      let(:item_name) { 'EXPLOSIVES' }

      it { is_expected.to be true } # TODO: extract to shared_examples
    end

    context 'when sfw' do
      let(:item_name) { 'This is completely safe' }

      it { is_expected.to be false } # TODO: extract to shared_examples
    end

    context 'when nil' do
      let(:item_name) { nil }

      it { is_expected.to be false } # TODO: extract to shared_examples
    end
  end

  describe '#validate' do
    subject { validator.validate }

    context 'when nsfw' do
      let(:item_name) { 'EXPLOSIVES' }

      it 'raises error' do
        expect { subject }.to raise_error(StandardError).with_message('item is nsfw')
      end
    end

    context 'when sfw' do
      let(:item_name) { 'This is completely safe' }

      it 'raises error' do
        expect { subject }.not_to raise_error # TODO: extract to shared_examples
      end
    end

    context 'when nil' do
      let(:item_name) { nil }

      it 'raises error' do
        expect { subject }.not_to raise_error # TODO: extract to shared_examples
      end
    end
  end
end
