require './lib/board'
require './lib/messages'
require 'pry'

class ComputerPlayer
  attr_accessor :computer_board

  def initialize
    @computer_board = Board.new
  end

  def char_set
    ["A", "B", "C", "D"]
  end

  def num_set
    ["1", "2", "3", "4"]
  end

  def seed
    (1..99).to_a
  end

  def generate_first_position
    "#{char_set.sample}#{num_set.sample}"
  end

  def modifier
    modifier_seed = seed.sample
    decrease_one = nil
    increase_one = nil
    do_nothing = nil
    if modifier_seed <= 33
      decrease_one = -1
    elsif modifier_seed >= 66
      increase_one = 1
    else
      do_nothing = 0
    end
    modifier
  end

  def possibilities
    {
      "A1" => ["A2", "B1"],
      "A2" => ["A1", "A3", "B2"],
      "A3" => ["A2", "A4", "B3"],
      "A4" => ["A3", "B4"],
      "B1" => ["B2", "A1", "C1"],
      "B2" => ["B1", "B3", "A2", "C2"],
      "B3" => ["B2", "B4", "A2", "C3"],
      "B4" => ["B3", "A4", "C4"],
      "C1" => ["C2", "B1", "D1"],
      "C2" => ["C1", "C3", "B2", "D2"],
      "C3" => ["C2", "C4", "B3", "D3"],
      "C4" => ["C3", "B4", "D4"],
      "D1" => ["D2", "C1"],
      "D2" => ["D1", "D3", "C2"],
      "D3" => ["D2", "D4", "C3"],
      "D4" => ["D3", "C4"]
    }
  end

  def generate_valid_second_position(position)
    split_position = position.chars
    # here i want to plus/minus one or do nothing from each
    # after that check to make sure that it is not the same as original pos
    # return the position as position_2

    position_2 = "#{char_set.sample}#{num_set.sample}"
    split_position_2 = position_2.chars




    # if (split_position_2[0].ord - split_position[0].ord) > 1
    #   generate_valid_second_position(position)
    # elsif (split_position_2[0].ord + split_position[0].ord) > 1
    #   generate_valid_second_position(position)
    # end
    # if (split_position_2[1].ord - split_position[1].ord) > 1
    #   generate_valid_second_position(position)
    # elsif (split_position_2[1].ord + split_position[1].ord) > 1
    #   generate_valid_second_position(position)
    # end
  end

  def small_ship_placement
    position_1 = generate_first_position
    position_2 = generate_valid_second_position(position_1)
    computer_board.place_ship("#{position_1} #{position_2}")
  end




end