# frozen_string_literal: true

RSpec.shared_context 'with mocked nsfw validator' do
  let(:nsfw_validator) { instance_double Items::NsfwValidator, nsfw?: nsfw? }
  let(:nsfw?) { double :nsfw? }
  let(:nsfw_validation_error) { StandardError.new('nsfw validation error') }

  before do
    allow(Items::NsfwValidator).to receive(:new).with(anything).and_return(nsfw_validator)
    allow(nsfw_validator).to receive(:validate)
    allow(nsfw_validator).to receive(:validate).and_raise(nsfw_validation_error) if nsfw?
  end
end
