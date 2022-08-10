# frozen_string_literal: true

require 'codebreaker'

module Command
  class StartCommand
    attr_reader :user_name, :code_breaker

    def initialize(user_name)
      @user_name = user_name
    end

    def execute
      create_game(enter_difficulty)
      start_game
    end

    def create_game(difficulty)
      @code_breaker = CodeBreaker::CodeBreakerGame.new @user_name, difficulty
    end

    def start_game
      loop do
        command = enter_command
        return @code_breaker.game if case_command(command, @code_breaker)
      rescue CodeBreaker::NoCommandError, CodeBreaker::ValidatorError,
             CodeBreaker::NoHintsLeftError => e
        puts e
      rescue CodeBreaker::NoAttemptsLeftError => e
        puts e
        return nil
      end
    end

    def case_command(command, game)
      case command
      when :guess then guess_process game

      when :hint then puts hint_process game

      else
        puts "!- Wrong Command (#{command})"
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
      user_input = gets.chop.strip.to_i
      result = game.action(:guess, user_input)
      puts "Result: #{result}"
      result == '++++'
    end

    def guess_run(input, game)
      game.action(:guess, input)
    end

    def hint_process(game)
      "Hint: #{hint_run(game)}"
    end

    def hint_run(game)
      game.action(:hint)
    end
  end
end
