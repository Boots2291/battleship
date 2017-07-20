require './lib/ai'
require './lib/player'
require 'pry'

class Board
  attr_accessor :grid,
                :patrol_boat,
                :frigate,
                :hit_counter,
                :display_board

  def initialize
    @grid = [[false, false, false, false],
             [false, false, false, false],
             [false, false, false, false],
             [false, false, false, false]]
    @patrol_boat = []
    @frigate = []
    @hit_counter = 0
    @display_board = [[false, false, false, false],
                     [false, false, false, false],
                     [false, false, false, false],
                     [false, false, false, false]]
  end

  def character_to_index(pos)
    character = pos.chars[0]
    lib = {"A" => 0, "B" => 1, "C" => 2, "D" => 3}
    lib[character]
  end

  def number_to_index(pos)
    number = pos.chars[1]
    lib = {"1" => 0, "2" => 1, "3" => 2, "4" => 3}
    lib[number]
  end

  def to_coordinates(pos)
    coordinate = []
    coordinate << character_to_index(pos)
    coordinate << number_to_index(pos)
    coordinate
  end

  def place_ship(input)
    positions = input.split(" ")
    pos_1 = to_coordinates(positions[0])
    pos_2 = to_coordinates(positions[1])
    grid[pos_1[0]][pos_1[1]] = true
    grid[pos_2[0]][pos_2[1]] = true
    if positions.count > 2
      pos_3 = to_coordinates(positions[2])
      grid[pos_3[0]][pos_3[1]] = true
    end
  end

  def fire(position, fire_at)
    if patrol_boat[0].include?(fire_at)
      puts "Hit!"
      display_board[position[0]][position[1]] = "H"
      patrol_boat[0].delete(fire_at)
      @hit_counter += 1
      if patrol_boat[0].length == 0
        puts "Patrol boat sunk!"
      end
    elsif frigate[0].include?(fire_at)
      puts "Hit!"
      display_board[position[0]][position[1]] = "H"
      frigate[0].delete(fire_at)
      @hit_counter += 1
      if frigate[0].length == 0
        puts "Frigate sunk!"
      end
    elsif grid[position[0]][position[1]] == "H"
      puts "You already shot there"
      false
    elsif grid[position[0]][position[1]] == "M"
      puts "You already shot there"
      false
    else
      display_board[position[0]][position[1]] = "M"
      puts "Miss"
    end
  end
end