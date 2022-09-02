# frozen_string_literal: true

module Command
  class RulesCommand
    def execute
      puts '--- Rules ---'
      puts '| So rules are really simple. CodeMaker generating code. You should break it'
      puts '| Secret code consist of 4 digits, you should guess it correctly'
      puts '| You enter code, in result you get symbols like "+", "-" or " "'
      puts '| "+" means that digit is exist and in the right position'
      puts '| "-" means the digit exist but not in the right position'
      puts '| " " means the digit is not exist'
      puts '--- ----- ---'
    end
  end
end
