# frozen_string_literal: true

module Command
  class StarsCommand
    attr_reader :rating

    def initialize(rating)
      @rating = rating
    end

    def execute
      puts '    Stars'
      puts @rating
    end
  end
end
