require './lib/computer_player'
require 'pry'

class ComputerPlayerTest < Minitest::Test

  def test_computer_player_has_a_board
    computer = ComputerPlayer.new
    assert computer.computer_board.grid
  end

  def test_computer_board_is_empty
    computer = ComputerPlayer.new
    refute computer.computer_board.grid.include?(true)
  end

  def test_computer_can_place_small_ship
    computer = ComputerPlayer.new
    computer.computer_board.place_ship("A1 A2")
    assert_equal true, computer.computer_board.grid[0][0]
    assert_equal true, computer.computer_board.grid[0][1]
    assert_equal false, computer.computer_board.grid[0][2]
  end

  def test_computer_can_place_large_ship
    computer = ComputerPlayer.new
    computer.computer_board.place_ship("A1 A2 A3")
    assert_equal true, computer.computer_board.grid[0][0]
    assert_equal true, computer.computer_board.grid[0][1]
    assert_equal true, computer.computer_board.grid[0][2]
    assert_equal false, computer.computer_board.grid[1][1]
    assert_equal false, computer.computer_board.grid[3][2]
  end

  def test_possibilities
    computer = ComputerPlayer.new
    target = computer.possibilities["A1"].sample
    assert String, target.class
    assert 2, target.length
  end
end