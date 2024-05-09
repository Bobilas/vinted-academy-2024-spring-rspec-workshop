# frozen_string_literal: true

RSpec.describe Items::Facade do
  describe '.items_for_sale' do
    # BONUS 1: write tests
  end

  describe '.sold_items' do
    # BONUS 2: write tests
  end

  describe '.upload' do
    subject { described_class.upload(**params) }

    let(:params) do
      {
        user_id: user_id,
        item_name: name,
        item_price: price,
        skip_nsfw_validation: skip_nsfw_validation?,
      }
    end

    let(:user_id) { user.id }
    let(:user) { create :user, :verified }
    let(:name) { 'test_item' }
    let(:price) { 42 }
    let(:skip_nsfw_validation?) { false }

    let(:nsfw_validator) { instance_double Items::NsfwValidator, nsfw?: nsfw? }
    let(:nsfw?) { double :nsfw? }

    before do
      allow(Items::NsfwValidator).to receive(:new).with(name).and_return(nsfw_validator)
      allow(nsfw_validator).to receive(:validate)
    end

    it 'validates nsfw' do
      expect(nsfw_validator).to receive(:validate)
      subject
    end

    it 'uploads item' do
      subject
      expect(Item).to exist(user_id: user_id, name: name, price: price, is_nsfw: nsfw?)
    end

    context 'when validation is skipped' do
      let(:skip_nsfw_validation?) { true }

      it 'skips nsfw validation' do
        expect(nsfw_validator).not_to receive(:validate)
        subject
      end
    end

    context 'when seller is not found' do
      let(:user_id) { -1 }

      it 'fails' do
        expect { subject }.to raise_error(StandardError).with_message('seller not found')
      end
    end

    context 'when seller is not verified' do
      let(:user) { create :user }

      it 'fails' do
        expect { subject }.to raise_error(StandardError).with_message('seller not verified')
      end
    end
  end

  describe '.sell' do
    # BONUS 3: write tests
  end
end
