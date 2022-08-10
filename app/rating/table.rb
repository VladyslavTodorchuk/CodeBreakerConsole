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

  def all_games
    easy = sort_games(easy_games, 3)
    medium = sort_games(medium_games, 3)
    hell = sort_games(hell_games, 3)

    print_rating(easy, medium, hell)
  end

  def print_rating(easy, medium, hell)
    puts '--- Stars --- '
    puts '--- Easy --- '
    print easy
    puts '---  Medium --- '
    print medium
    puts '--- Hell --- '
    print hell
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
      [elem[:game][:used_attempts], elem[:game][:used_hints], elem[:user]]
    end
    games.uniq { |u| [u[:user]] }.first(top_rating)
  end

  def print(games)
    games.each do |game|
      puts "-| #{game[:user]} || attempts: #{game[:game][:used_attempts]} hints: #{game[:game][:used_hints]}"
    end
  end
end
