require './lib/board'
require './lib/messages'
require 'pry'

class ComputerPlayer
  attr_accessor :computer_board,
                :patrol_boat,
                :frigate,
                :ships_remaining

  def initialize
    @computer_board = Board.new
    @patrol_boat = []
    @frigate = []
    @ships_remaining = 2
  end

  def char_set
    ["A", "B", "C", "D"]
  end

  def num_set
    ["1", "2", "3", "4"]
  end

  def generate_first_position
    "#{char_set.sample}#{num_set.sample}"
  end

  def possibilities_for_small_ship
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

  def possibilities_for_large_ship
    {
    "A1"=>[["A2","A3"],["B1","C1"]],
    "A2"=>[["A1","A3"],["B2","C2"]],
    "A3"=>[["A2","A4"],["B3","C3"]],
    "A4"=>[["A2","A3"],["B4","C4"]],
    "B1"=>[["A1","C1"],["B2","B3"]],
    "B2"=>[["B1","B3"],["A2","C2"]],
    "B3"=>[["B2","B4"],["A3","C3"]],
    "B4"=>[["B2","B3"],["A4","C4"]],
    "C1"=>[["B1","D1"],["C2","C3"]],
    "C2"=>[["B2","D2"],["C1","C3"]],
    "C3"=>[["B3","D3"],["C2","C4"]],
    "C4"=>[["B4","D4"],["C2","C3"]],
    "D1"=>[["B1","C1"],["D2","D3"]],
    "D2"=>[["D1","D3"],["B2","C2"]],
    "D3"=>[["D2","D4"],["C3","B3"]],
    "D4"=>[["B4","C4"],["D2","D3"]]
    }
  end

  def generate_position_for_small_ship(position_1)
    position_2 = possibilities_for_small_ship[position_1].sample
  end

  def generate_position_for_large_ship(position_1)
    position_3 = possibilities_for_large_ship[position_1].sample
  end

  def place_patrol_boat
    position_1 = generate_first_position
    position_2 = generate_position_for_small_ship(position_1)
    patrol_boat << ["#{position_1} #{position_2}"].join
    computer_board.place_ship("#{position_1} #{position_2}")
  end

  def place_frigate
    position_1 = generate_first_position
    positions = generate_position_for_large_ship(position_1)
    position_2 = positions[0]
    position_3 = positions[1]
    if patrol_boat.include?(position_1)
      place_frigate
    elsif patrol_boat.include?(position_2)
      place_frigate
    elsif patrol_boat.include?(position_3)
      place_frigate
    else
      frigate << ["#{position_1} #{position_2} #{position_3}"].join
      computer_board.place_ship("#{position_1} #{position_2} #{position_3}")
    end
  end

end