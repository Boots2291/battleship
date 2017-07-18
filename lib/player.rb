require './lib/board'
require './lib/messages'
require 'pry'

class ComputerPlayer
  attr_accessor :player_board,
                :patrol_boat,
                :frigate,
                :ships_remaining

  def initialize
    @player_board = Board.new
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

  def get_patrol_boat_coordinates
    # need a message
    patrol_boat_coordinates = gets.chomp
    hold_for_validation = []
    hold_for_validation << patrol_boat_coordinates
    if validate_patrol_boat(hold_for_validation) == true
      patrol_boat << patrol_boat_coordinates
    else
      # need a message
      get_patrol_boat_coordinates
    end
  end

  def validate_patrol_boat(hold_for_validation)
    hold_for_validation.split(" ")
    position_1 = hold_for_validation[0]
    position_2 = hold_for_validation[1]
    if


  def get_frigate_coordinates
    # need a message
    frigate_coordinates = gets.chomp
    hold_for_validation = []
    hold_for_validation << frigate_coordinates
    if validate_frigate(frigate_coordinates) == true
      frigate << frigate_coordinates
    else
      # need a message
      get_frigate_coordinates
    end
  end

  def patrol_boat_coords_hash
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

  def frigate_coords_hash
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


  def place_patrol_boat
    position_1 = patrol_boat[0]
    position_2 = patrol_boat[1]
    place_ship("#{position_1} #{position_2}")
  end

  def place_frigate
    position_1 = frigate[0]
    position_2 = frigate[1]
    position_3 = frigate[2]
    place_ship("#{position_1} #{position_2} #{position_3}")
  end

end