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

  def generate_first_position
    "#{char_set.sample}#{num_set.sample}"
  end

  def generate_valid_second_position(position)
    split_position = position.chars
    
    # position_2 = "#{char_set.sample}#{num_set.sample}"
    # split_position_2 = position_2.chars
    # if (split_position_2[0].ord - split_position[0].ord).abs > 1
    #   generate_valid_second_position(position)
    # elsif (split_position_2[1].ord - split_position[1].ord).abs > 1
    #   generate_valid_second_position(position)
    # else
    #   return
    # end
    # position_2
  end

  def small_ship_placement
    position_1 = generate_first_position
    position_2 = generate_valid_second_position(position_1)
    computer_board.place_ship("#{position_1} #{position_2}")
  end




end