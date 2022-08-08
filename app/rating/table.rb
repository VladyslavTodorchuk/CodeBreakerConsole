# frozen_string_literal: true

class Table
  attr_accessor :rating

  def initialize
    @rating = []
  end

  def add_user(user_obj, game)
    @rating << { user: user_obj, game: {
      used_attempts: game.used_attempts,
      used_hints: game.used_hints,
      difficulty: game.difficulty
    } }
  end
end
