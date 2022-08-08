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

  def hell_games
    @rating.select { |hash| hash[:game][:difficulty] == 'hell' }
  end

  def medium_games
    @rating.select { |hash| hash[:game][:difficulty] == 'medium' }
  end

  def easy_games
    @rating.select { |hash| hash[:game][:difficulty] == 'easy' }
  end

  def sort_games(games, top_rating = 1)
    games = games.sort_by! do |elem|
      [elem[:game][:used_attempts], elem[:game][:used_hints], elem[:user].name]
    end
    games.uniq { |u| [u[:user].name] }.first(top_rating)
  end

  def print_rating(games)
    games.each do |game|
      puts "-| #{game[:user].name} || attempts: #{game[:game][:used_attempts]} hints: #{game[:game][:used_hints]}"
    end
  end
end
