# frozen_string_literal: true

RSpec.describe Command::StarsCommand do
  let(:table) { instance_double('Table') }

  context 'when all_games runs' do
    before do
      allow(table).to receive(:all_games)
      described_class.new(table).execute
    end

    it 'runs all_game command' do
      expect(table).to have_received(:all_games)
    end
  end
end
