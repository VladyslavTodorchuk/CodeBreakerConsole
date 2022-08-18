# frozen_string_literal: true

require 'fileutils'

RSpec.describe Command::Executor do
  let(:executor) { described_class.new }

  let(:rules_command) { instance_double('Command::RulesCommand') }
  let(:stars_command) { instance_double('Command::StarsCommand') }
  let(:start_command) { instance_double('Command::StartCommand') }

  describe '#execute' do
    context 'when executor runs rules_command method execute' do
      before do
        allow(Command::RulesCommand).to receive(:new) { rules_command }
        allow(rules_command).to receive(:execute)
      end

      it do
        executor.run(rules_command)
        expect(rules_command).to have_received(:execute)
      end
    end

    context 'when executor runs stars_command method execute' do
      before do
        allow(Command::StarsCommand).to receive(:new) { stars_command }
        allow(stars_command).to receive(:execute)
      end

      it do
        executor.run(stars_command)
        expect(stars_command).to have_received(:execute)
      end
    end

    context 'when executor runs start_command method execute' do
      before do
        allow(Command::StartCommand).to receive(:new) { start_command }
        allow(start_command).to receive(:execute)
      end

      it do
        executor.run(start_command)
        expect(start_command).to have_received(:execute)
      end
    end

    context 'when executor runs start_command method execute' do
      before do
        allow(Command::StartCommand).to receive(:new) { start_command }
        allow(start_command).to receive(:execute)
      end

      it do
        executor.run(start_command)
        expect(start_command).to have_received(:execute)
      end
    end
  end
end
