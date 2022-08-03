# frozen_string_literal: true

module Command
  class Command
    def execute(command)
      command&.execute
    end
  end
end
