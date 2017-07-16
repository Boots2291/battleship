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
  
end