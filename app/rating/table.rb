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
    game_hash = sort_games(3)
    print(game_hash)
  end

  def sort_games(top_rating = 1)
    games_hash = @rating.group_by { |d| d[:game][:difficulty] }
    games_hash.each do |difficulty, games|
      sorted_games = games.sort_by! do |elem|
        [elem[:game][:used_attempts], elem[:game][:used_hints], elem[:user]]
      end
      games_hash[difficulty] = sorted_games.uniq { |u| [u[:user]] }.first(top_rating)
    end
    games_hash
  end

  def print(games_hash)
    games_hash.each do |difficulty, games|
      puts difficulty
      games.each do |game|
        puts "#{game[:user]}  used_attempts : | #{game[:game][:used_attempts]} | used_hints : | #{game[:game][:used_hints]} |"
      end
    end
  end
end
