# frozen_string_literal: true

RSpec.describe Table do
  shared_examples 'grouping' do
    it 'group by difficulties' do
      expect(code).to match_array(result)
    end
  end

  let(:table) { described_class.new }
  let(:rating_hell) do
    [{ user: 'Vlad', game: { used_attempts: 4, used_hints: 1, difficulty: 'hell' } },
     { user: 'Zack', game: { used_attempts: 4, used_hints: 2, difficulty: 'hell' } },
     { user: 'Karl', game: { used_attempts: 9, used_hints: 0, difficulty: 'hell' } }]
  end
  let(:rating_medium) do
    [{ user: 'Vlad', game: { used_attempts: 4, used_hints: 1, difficulty: 'medium' } },
     { user: 'Zack', game: { used_attempts: 4, used_hints: 2, difficulty: 'medium' } },
     { user: 'Karl', game: { used_attempts: 9, used_hints: 0, difficulty: 'medium' } }]
  end
  let(:rating_easy) do
    [{ user: 'Vlad', game: { used_attempts: 4, used_hints: 1, difficulty: 'easy' } },
     { user: 'Zack', game: { used_attempts: 4, used_hints: 2, difficulty: 'easy' } },
     { user: 'Karl', game: { used_attempts: 9, used_hints: 0, difficulty: 'easy' } }]
  end

  after { table.rating = [] }

  describe '#hell_games' do
    before do
      table.rating = rating_hell + rating_easy
    end

    context 'when hell_games return right array' do
      let(:code) { table.hell_games }
      let(:result) { rating_hell }

      include_examples 'grouping'
    end
  end

  describe '#medium_games' do
    before do
      table.rating = rating_medium + rating_easy
    end

    context 'when hell_games return right array' do
      let(:code) { table.medium_games }
      let(:result) { rating_medium }

      include_examples 'grouping'
    end
  end

  describe '#easy_games' do
    before do
      table.rating = rating_easy + rating_medium
    end

    context 'when hell_games return right array' do
      let(:code) { table.easy_games }
      let(:result) { rating_easy }

      include_examples 'grouping'
    end
  end

  describe '#sort_games' do
    before do
      table.rating = rating_medium
    end

    it 'sort array of game attempts, hint and name ' do
      expect(table.sort_games(table.medium_games, 3)).to match_array(rating_medium)
    end
  end
end
