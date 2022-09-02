# frozen_string_literal: true

RSpec.describe Table do
  shared_examples 'grouping' do
    it 'group by difficulties' do
      expect(code).to match_array(result)
    end
  end

  let(:table) { described_class.new }
  let(:rating) do
    [{ user: 'Zack2', game: { used_attempts: 4, used_hints: 2, difficulty: 'hell' } },
     { user: 'Zack1', game: { used_attempts: 4, used_hints: 1, difficulty: 'hell' } },
     { user: 'Vlad2', game: { used_attempts: 4, used_hints: 1, difficulty: 'easy' } },
     { user: 'Vlad1', game: { used_attempts: 3, used_hints: 1, difficulty: 'easy' } },
     { user: 'Karl1', game: { used_attempts: 9, used_hints: 0, difficulty: 'medium' } }]
  end
  let(:rating_sorted) do
    [
      ['easy', [
        { user: 'Vlad1', game: { used_attempts: 3, used_hints: 1, difficulty: 'easy' } },
        { user: 'Vlad2', game: { used_attempts: 4, used_hints: 1, difficulty: 'easy' } }
      ]],
      ['medium', [
        { user: 'Karl1', game: { used_attempts: 9, used_hints: 0, difficulty: 'medium' } }
      ]],
      ['hell', [
        { user: 'Zack1', game: { used_attempts: 4, used_hints: 1, difficulty: 'hell' } },
        { user: 'Zack2', game: { used_attempts: 4, used_hints: 2, difficulty: 'hell' } }
      ]]
    ]
  end

  describe '#sort_games' do
    before do
      table.rating = rating
    end

    it 'sort array of game attempts, hint and name ' do
      expect(table.sort_games(2)).to match_array(rating_sorted)
    end
  end
end
