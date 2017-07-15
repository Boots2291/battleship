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

  def test_character_to_index
    board = Board.new
    assert_equal 0, board.character_to_index("A1")
    assert_equal 1, board.character_to_index("B2")
    assert_equal 2, board.character_to_index("C1")
    assert_equal 3, board.character_to_index("D2")
  end

  def test_number_to_index
    board = Board.new
    assert_equal 0, board.number_to_index("A1")
    assert_equal 1, board.number_to_index("B2")
    assert_equal 2, board.number_to_index("C3")
    assert_equal 3, board.number_to_index("D4")
  end

  def test_to_coordinates
    board = Board.new
    assert_equal [[1],[3]], board.to_coordinates("B4")
  end
end
