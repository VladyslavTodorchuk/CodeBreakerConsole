# frozen_string_literal: true

require_relative 'command'

module Command
  class StartCommand < Command
    def execute
      puts 'Start'
    end
  end
end
