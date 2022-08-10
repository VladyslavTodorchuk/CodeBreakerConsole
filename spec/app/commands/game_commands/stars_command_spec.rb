# frozen_string_literal: true

RSpec.describe Command::StarsCommand do
  let(:rating) { instance_double('Table') }
  let(:command) { described_class.new rating }

  describe '#execute' do
    before do
      allow(rating).to receive(:all_games)
      command.execute
    end

    it do
      expect(rating).to have_received(:all_games)
    end
  end
end
