# frozen_string_literal: true

require 'codebreaker'

module Command
  class StartCommand
    attr_reader :name

    def initialize(name)
      @name = name
    end

    def execute
      start_game
    end

    private

    def start_game
      is_over = false
      game = CodeBreaker::CodeBreakerGame.new @name, enter_difficulty
      until is_over
        begin
          command = enter_command
          case command
          when :guess then is_over == true if guess_process game

          when :hint then puts hint_process game

          end
        rescue CodeBreaker::NoCommandError => e
          puts e
        rescue CodeBreaker::ValidatorError => e
          puts e
        rescue CodeBreaker::NoHintsLeftError => e
          puts e
        rescue CodeBreaker::NoAttemptsLeftError => e
          puts e
          is_over = true
        end
      end
    end

    def enter_difficulty
      print 'Pick difficulty (easy, medium, hell) '
      gets.chop.strip
    end

    def enter_command
      print 'Enter command(:guess, :hint) '
      gets.chop.strip.to_sym
    end

    def guess_process(game)
      print 'Enter guess '
      user_input = gets.chop.to_i
      result = game.action(:guess, user_input)
      puts "Result: #{result}"
      result == '++++'
    end

    def hint_process(game)
      "Hint: #{game.action(:hint)}"
    end
  end
end
