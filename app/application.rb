# frozen_string_literal: true

require './commands/command'
require './commands/start_command'
require './commands/stars_command'
require './commands/rules_command'

puts 'Welcome to CodeBreaker game'
is_exit = false
cmd = Command::Command.new

unless is_exit
  begin
    puts 'Enter commands: '
    command = gets.chomp.strip
    case command
    when 'start' then cmd.execute(Command::StartCommand.new)
    when 'rules' then cmd.execute(Command::RulesCommand.new)
    when 'stars' then cmd.execute(Command::StarsCommand.new)
    when 'exit' then is_exit = true
    else
      puts '!- Wrong commands'
    end
  rescue Error => e
    puts e
  end
end

puts 'Exit'
