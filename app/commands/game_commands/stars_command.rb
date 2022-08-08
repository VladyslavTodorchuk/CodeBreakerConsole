# frozen_string_literal: true

module Command
  class StarsCommand
    attr_reader :rating

    def initialize(rating)
      @rating = rating
    end

    def execute
      puts '    Stars'

      easy = @rating.sort_games(@rating.easy_games, 3)
      medium = @rating.sort_games(@rating.medium_games, 3)
      hell = @rating.sort_games(@rating.hell_games, 3)

      print_rating(easy, medium, hell)
    end

    def print_rating(easy, medium, hell)
      puts '  Easy'
      @rating.print_rating easy
      puts '  Medium'
      @rating.print_rating medium
      puts '  Hell'
      @rating.print_rating hell
    end
  end
end
