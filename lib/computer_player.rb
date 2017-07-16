require './lib/board'
require './lib/messages'
require 'pry'

class ComputerPlayer
  attr_accessor :computer_board

  def initialize
    @computer_board = Board.new
  end

  def char_set
    char = ["A", "B", "C", "D"]
  end

  def num_set
    num = ["1", "2", "3", "4"]
  end

  def small_ship_placement
    position_1 = "#{char_set.sample}#{num_set.sample}"
    generate_valid_option(position_1)
  end

  def generate_valid_option(position)
    split_position == position.chars



  end





end