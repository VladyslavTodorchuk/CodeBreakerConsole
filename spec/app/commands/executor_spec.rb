# frozen_string_literal: true

require 'fileutils'

RSpec.describe Command::Executor do
  let(:executor) { described_class.new }
  let(:command) { instance_double('Command::Command') }

  describe '#execute' do
    context 'when executor runs rules_command method execute' do
      before do
        allow(Command::RulesCommand).to receive(:new) { command }
        allow(command).to receive(:execute)
      end
      it 'runs commands' do
        executor.run(Command::RulesCommand.new)
        expect(command).to have_received(:execute)
      end
    end

    context 'when executor runs stars_command method execute' do
      before do
        allow(Command::StarsCommand).to receive(:new).with([]) { command }
        allow(command).to receive(:execute)
      end

      it do
        executor.run(Command::StarsCommand.new([]))
        expect(command).to have_received(:execute)
      end
    end

    context 'when executor runs start_command method execute' do
      before do
        allow(Command::StartCommand).to receive(:new).with('Vlad') { command }
        allow(command).to receive(:execute)
      end

      it do
        executor.run(Command::StartCommand.new('Vlad'))
        expect(command).to have_received(:execute)
      end
    end
  end
end
