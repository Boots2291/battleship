require './lib/board.rb'

class ComputerPlayer
  attr_accessor :computer_board

  def initialize
    @computer_board = Board.new
  end
end