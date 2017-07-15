require 'minitest/autorun'
require 'minitest/pride'
require './lib/board'

class BoardTest < Minitest::Test

  def test_board_initializes
    board = Board.new
    assert_equal Board, board.class
  end

  def test_board_initializes_empty
    board = Board.new
    refute board.grid.include?(true)
  end
end
