# frozen_string_literal: true

RSpec.describe Command::StartCommand do
  let(:command) { described_class.new('Vlad') }
  let(:game) { instance_double('game') }

  before { command.create_game('easy') }

  describe '#guess_run' do
    it 'run :guess command ' do
      expect(command.guess_run(1234, command.code_breaker)).to be_instance_of(String)
    end

    it 'run :guess command ' do
      expect do
        command.guess_run(nil, command.code_breaker)
      end.to raise_error(CodeBreaker::ValidatorError, 'Input is nil')
    end

    it 'run :guess command raise NoAttemptsLeftError ' do
      allow(game).to receive(:action).with(:guess, 1234).and_raise(CodeBreaker::NoAttemptsLeftError,
                                                                                    'You have no attempts left')
      expect do
        command.guess_run(1234,
                          game)
      end.to raise_error(CodeBreaker::NoAttemptsLeftError, 'You have no attempts left')
    end
  end

  describe '#hint_run' do
    it 'run :hint command ' do
      expect(command.hint_run(command.code_breaker)).to be_instance_of(Integer)
    end

    it 'run :hint command raise NoHintsLeftError ' do
      allow(game).to receive(:action).with(:hint).and_raise(CodeBreaker::NoHintsLeftError, 'You have no hints left')
      expect do
        command.hint_run(game)
      end.to raise_error(CodeBreaker::NoHintsLeftError, 'You have no hints left')
    end
  end
end
