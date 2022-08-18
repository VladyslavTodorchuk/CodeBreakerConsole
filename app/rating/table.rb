# frozen_string_literal: true

class Table
  attr_accessor :rating

  def initialize
    @rating = []
  end

  def add_user(user_obj, game)
    rating << { user: user_obj, game: {
      used_attempts: game.used_attempts,
      used_hints: game.used_hints,
      difficulty: game.difficulty
    } }
  end

  def all_games
    games_hash = { easy: easy_games, medium: medium_games, hell: hell_games }
    game_hash = sort_games(games_hash, 3)

    print_rating(game_hash[:easy], game_hash[:medium], game_hash[:hell])
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
    rating.select { |hash| hash[:game][:difficulty] == 'hell' }
  end

  def medium_games
    rating.select { |hash| hash[:game][:difficulty] == 'medium' }
  end

  def easy_games
    rating.select { |hash| hash[:game][:difficulty] == 'easy' }
  end

  def sort_games(games_hash, top_rating = 1)
    games_hash.each do |difficulty, games|
      sorted_games = games.sort_by! do |elem|
        [elem[:game][:used_attempts], elem[:game][:used_hints], elem[:user]]
      end
      games_hash[difficulty] = sorted_games.uniq { |u| [u[:user]] }.first(top_rating)
    end
    games_hash
  end

  def print(games)
    games.each do |game|
      puts "-| #{game[:user]} || attempts: #{game[:game][:used_attempts]} hints: #{game[:game][:used_hints]}"
    end
  end
end
