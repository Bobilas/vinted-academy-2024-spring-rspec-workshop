# frozen_string_literal: true

RSpec.describe Users::Facade do
  describe '.register' do
    subject { described_class.register(name) }

    let(:name) { 'test_user' }

    it 'registers new user' do
      expect { subject }.to change(User, :count).by(1)
      expect(User).to exist(name: name)
    end

    context 'when name is nil' do
      let(:name) { nil }

      it 'fails' do
        expect { subject }.to raise_error ActiveRecord::NotNullViolation
      end
    end

    context 'with duplicate name' do
      before { create :user, name: name }

      it 'fails' do
        expect { subject }.to raise_error ActiveRecord::RecordNotUnique
      end
    end
  end

  describe '.verify' do
    subject { described_class.verify(user_id) }

    let(:user_id) { user.id }
    let(:user) { create :user }

    it 'verifies user' do
      expect { subject }.to change { user.reload.is_verified }.from(false).to(true)
    end

    context 'when user is not found' do
      let(:user_id) { -1 }

      it 'fails' do
        expect { subject }.to raise_error(StandardError).with_message('not found')
      end
    end

    context 'when user is already verified' do
      before { described_class.verify(user_id) }

      it 'fails' do
        expect { subject }.to raise_error(StandardError).with_message('already verified')
      end
    end
  end

  describe '.verified_user_ids' do
    subject { described_class.verified_user_ids }

    let!(:verified_users) { create_list :user, 2, :verified }
    let!(:unverified_users) { create_list :user, 2 }
    let(:verified_user_ids) { verified_users.pluck(:id) }

    it { is_expected.to match_array verified_user_ids }

    context 'with all users verified' do
      before do
        unverified_users.pluck(:id).each { |user_id| described_class.verify(user_id) }
      end

      let(:verified_user_ids) { (verified_users + unverified_users).pluck(:id) }

      it { is_expected.to match_array verified_user_ids }
    end
  end
end
