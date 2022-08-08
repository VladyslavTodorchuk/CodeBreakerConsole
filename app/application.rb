# frozen_string_literal: true

require_relative './commands/game_commands/start_command'
require_relative './commands/game_commands/stars_command'
require_relative './commands/game_commands/rules_command'
require_relative './commands/executor'
require_relative './commands/yml_commands/load_command'
require_relative './commands/yml_commands/save_command'
require_relative 'rating/table'
require_relative 'rating/user'

executor = Command::Executor.new
table = executor.run(Command::LoadCommand.new)

puts 'Welcome to CodeBreaker game'
puts 'What is your name: '
name = gets.chomp.strip
user = table.rating.find { |hash| hash[:user].name == name }[:user]
user = User.new name if user.nil?

loop do
  puts 'Enter commands: (start, stars, rules)'
  command = gets.chomp.strip.downcase
  case command
  when 'start'
    code_breaker = executor.run(Command::StartCommand.new(user))
    table.add_user(user, code_breaker) unless code_breaker.nil?
  when 'rules' then executor.run(Command::RulesCommand.new)

  when 'stars' then executor.run(Command::StarsCommand.new(table))

  when 'exit'
    executor.run(Command::SaveCommand.new(table))
    break

  else
    puts '!- Wrong commands'
  end
end

puts 'Exit'
