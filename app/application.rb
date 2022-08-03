# frozen_string_literal: true

require './commands/command'
require './commands/start_command'
require './commands/stars_command'
require './commands/rules_command'
require '../app/commands/executor'

puts 'Welcome to CodeBreaker game'
is_exit = false
cmd = Command::Executor.new

unless is_exit
  begin
    puts 'Enter commands: '
    command = gets.chomp.strip
    case command
    when 'start' then cmd.run(Command::StartCommand.new)
    when 'rules' then cmd.run(Command::RulesCommand.new)
    when 'stars' then cmd.run(Command::StarsCommand.new)
    when 'exit' then is_exit = true
    else
      puts '!- Wrong commands'
    end
  rescue Error => e
    puts e
  end
end

puts 'Exit'
