# frozen_string_literal: true

RSpec.describe Items::NsfwValidator do
  let(:validator) { described_class.new(item_name) }
  let(:keywords) { %w(explosive balls) }

  before { allow(Items::NsfwKeywords).to receive(:run).and_return(keywords) }

  describe '#nsfw?' do
    subject { validator.nsfw? }

    shared_examples 'nsfw true' do
      it { is_expected.to be true }
    end

    shared_examples 'nsfw false' do
      it { is_expected.to be true }
    end

    context 'when nsfw' do
      let(:item_name) { 'EXPLOSIVES' }

      it_behaves_like 'nsfw true'
    end

    context 'when sfw' do
      let(:item_name) { 'This is completely safe' }

      it_behaves_like 'nsfw false'
    end

    context 'when nil' do
      let(:item_name) { nil }

      it_behaves_like 'nsfw false'
    end
  end

  describe '#validate' do
    subject { validator.validate }

    shared_examples 'error' do
      it 'raises error' do
        expect { subject }.to raise_error(StandardError).with_message('item is nsfw')
      end
    end

    shared_examples 'no error' do
      it 'does not fail' do
        expect { subject }.not_to raise_error
      end
    end

    context 'when nsfw uppercase' do
      let(:item_name) { 'EXPLOSIVES' }

      it_behaves_like 'error'
    end

    context 'when nsfw lowercase' do
      let(:item_name) { 'explosives' }

      it_behaves_like 'error'
    end

    context 'when sfw' do
      let(:item_name) { 'This is completely safe' }

      it_behaves_like 'no error'
    end

    context 'when nil' do
      let(:item_name) { nil }

      it_behaves_like 'no error'
    end
  end
end
