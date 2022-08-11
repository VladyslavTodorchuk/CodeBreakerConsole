# frozen_string_literal: true

RSpec.describe Table do
  RSpec.shared_examples 'grouping' do
    it 'group by difficulties' do
      expect(code).to match_array(result)
    end
  end

  let(:table) { described_class.new }
  let(:data) { { user: 'Vlad', game: { used_attempts: rand(1..14), used_hints: rand(0..2), difficulty: 'easy' } } }
  after { table.rating = [] }

  describe '#add_user' do
    it 'add user game to rating array' do
      table.rating << data
      expect(table.rating).to match_array([data])
    end
  end

  describe '#hell_games' do
    before do
      @hell_game = { user: 'Vlad', game: { used_attempts: rand(1..4), used_hints: rand(0..1), difficulty: 'hell' } }
      table.rating << @hell_game
      table.rating << data
    end

    context 'when hell_games return right array' do
      let(:code) { table.hell_games }
      let(:result) { [@hell_game] }

      include_examples 'grouping'
    end
  end

  describe '#medium_games' do
    before do
      @medium_game = { user: 'Vlad', game: { used_attempts: rand(1..9), used_hints: rand(0..2), difficulty: 'medium' } }
      table.rating << @medium_game
      table.rating << data
    end

    context 'when hell_games return right array' do
      let(:code) { table.medium_games }
      let(:result) { [@medium_game] }

      include_examples 'grouping'
    end
  end

  describe '#easy_games' do
    before do
      @medium_game = { user: 'Vlad', game: { used_attempts: rand(1..9), used_hints: rand(0..2), difficulty: 'medium' } }
      table.rating << @medium_game
      table.rating << data
    end

    context 'when hell_games return right array' do
      let(:code) { table.easy_games }
      let(:result) { [data] }

      include_examples 'grouping'
    end
  end

  describe '#sort_games' do
    before do
      @result = [
        { user: 'Vlad', game: { used_attempts: 4, used_hints: 1, difficulty: 'medium' } },
        { user: 'Zack', game: { used_attempts: 4, used_hints: 2, difficulty: 'medium' } },
        { user: 'Karl', game: { used_attempts: 9, used_hints: 0, difficulty: 'medium' } }
      ]
      table.rating << @result[2]
      table.rating << @result[0]
      table.rating << @result[1]
      table.rating << data
    end

    it 'sort array of game bu attempts, hint and name ' do
      expect(table.sort_games(table.medium_games, 3)).to match_array(@result)
    end
  end
end
