require './lib/board'
require './lib/messages'
require './lib/ai'
require 'pry'

class Player
  attr_accessor :player_board,
                :ai_board_display

  def initialize
    @player_board = Board.new
    @ai_board_display = Board.new
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
    position_1 = patrol_boat_coordinates.split(" ")[0]
    position_2 = patrol_boat_coordinates.split(" ")[1]
    if validate_patrol_boat(patrol_boat_coordinates) == true
      player_board.patrol_boat << position_1
      player_board.patrol_boat << position_2
      player_board.place_ship(patrol_boat_coordinates)
    else
      # need a message
      get_patrol_boat_coordinates
    end
  end

  def validate_patrol_boat(patrol_boat_coordinates)
    position_1 = patrol_boat_coordinates.split(" ")[0]
    position_2 = patrol_boat_coordinates.split(" ")[1]
    if patrol_boat_coords_hash[position_1].include?(position_2)
      true
    else
      false
    end
  end

  def get_frigate_coordinates
    # need a message
    frigate_coordinates = gets.chomp
    if validate_frigate(frigate_coordinates) == true
      player_board.frigate << frigate_coordinates
      player_board.place_ship("#{frigate_coordinates}")
    else
      # need a message
      get_frigate_coordinates
    end
  end

  def validate_frigate(frigate_coordinates)
    position_1 = frigate_coordinates.split(" ")[0]
    position_2 = frigate_coordinates.split(" ")[1]
    position_3 = frigate_coordinates.split(" ")[2]
    coords_to_check = []
    coords_to_check << position_2
    coords_to_check << position_3
    if player_board.patrol_boat.include?(position_1)
      get_frigate_coordinates
    elsif player_board.patrol_boat.include?(position_2)
      get_frigate_coordinates
    elsif player_board.patrol_boat.include?(position_3)
      get_frigate_coordinates
    elsif frigate_coords_hash[position_1].include?(coords_to_check)
      true
    else
      false
    end
  end

  def player_fire
    # need a message
    fire_at = gets.chomp
    position = player.player_board.to_coordinates(fire_at)
    # if ai.ai_board[position[0]][position[1]] == true
    if ai.ai_board.patrol_boat[0].include?(fire_at)
      "You hit the patrol boat!"
      # update display board
    elsif ai.ai_board.frigate[0].include?(fire_at)
      "You hit the frigate!"
      # update display board
    elsif



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
      "A1"=>[["A2","A3"],["A3","A2"],["B1","C1"],["C1","B1"]],
      "A2"=>[["A1","A3"],["A3","A1"],["B2","C2"],["C2","B2"]],
      "A3"=>[["A2","A4"],["A4","A2"],["B3","C3"],["C3","B3"]],
      "A4"=>[["A2","A3"],["A3","A2"],["B4","C4"],["C4","B4"]],
      "B1"=>[["A1","C1"],["C1","A1"],["B2","B3"],["B3","B2"]],
      "B2"=>[["B1","B3"],["B3","B1"],["A2","C2"],["C2","A2"]],
      "B3"=>[["B2","B4"],["B4","B2"],["A3","C3"],["C3","A3"]],
      "B4"=>[["B2","B3"],["B3","B2"],["A4","C4"],["C4","A4"]],
      "C1"=>[["B1","D1"],["D1","B1"],["C2","C3"],["C3","C2"]],
      "C2"=>[["B2","D2"],["D2","B2"],["C1","C3"],["C3","C1"]],
      "C3"=>[["B3","D3"],["D3","B3"],["C2","C4"],["C4","C2"]],
      "C4"=>[["B4","D4"],["D4","B4"],["C2","C3"],["C3","C2"]],
      "D1"=>[["B1","C1"],["C1","B1"],["D2","D3"],["D3","D2"]],
      "D2"=>[["D1","D3"],["D3","D1"],["B2","C2"],["C2","B2"]],
      "D3"=>[["D2","D4"],["D4","D2"],["C3","B3"],["B2","C2"]],
      "D4"=>[["B4","C4"],["C4","B4"],["D2","D3"],["D3","D2"]]
    }
  end

end