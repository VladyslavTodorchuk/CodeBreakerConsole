# frozen_string_literal: true

require_relative './commands/game_commands/start_command'
require_relative './commands/game_commands/stars_command'
require_relative './commands/game_commands/rules_command'
require_relative './commands/executor'
require_relative './commands/yml_commands/load_command'
require_relative './commands/yml_commands/save_command'
require_relative 'rating'

puts 'Welcome to CodeBreaker game'
puts 'What is your name: '
name = gets.chomp.strip

executor = Command::Executor.new
rating = executor.run(Command::LoadCommand.new)

loop do
  puts 'Enter commands: '
  command = gets.chomp.strip.downcase
  case command
  when 'start' then executor.run(Command::StartCommand.new(name))

  when 'rules' then executor.run(Command::RulesCommand.new)

  when 'stars' then executor.run(Command::StarsCommand.new)

  when 'exit'
    executor.run(Command::SaveCommand.new(rating))
    break

  else
    puts '!- Wrong commands'
  end
end

puts 'Exit'
