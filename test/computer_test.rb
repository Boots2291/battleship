require './lib/ai'
require './test/test_helper'

class AITest < Minitest::Test

  def test_ai_player_has_a_board
    skip
    ai = AI.new(ai_board, player_board, hit_counter)
    assert ai.ai_board.grid
  end

  def test_ai_board_is_empty
    skip
    ai = AI.new(ai_board, player_board, hit_counter)
    refute ai.ai_board.grid.include?(true)
  end

  def test_ai_can_place_small_ship
    skip
    ai = AI.new(ai_board, player_board, hit_counter)
    ai.ai_board.place_ship("A1 A2")
    assert_equal true, ai.ai_board.grid[0][0]
    assert_equal true, ai.ai_board.grid[0][1]
    assert_equal false, ai.ai_board.grid[0][2]
  end

  def test_ai_can_place_large_ship
    skip
    ai = AI.new(ai_board, player_board, hit_counter)
    ai.ai_board.place_ship("A1 A2 A3")
    assert_equal true, ai.ai_board.grid[0][0]
    assert_equal true, ai.ai_board.grid[0][1]
    assert_equal true, ai.ai_board.grid[0][2]
    assert_equal false, ai.ai_board.grid[1][1]
    assert_equal false, ai.ai_board.grid[3][2]
  end
end