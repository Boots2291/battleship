class Board
  attr_reader :grid

  def initialize
    @grid = [[false, false, false, false],
             [false, false, false, false],
             [false, false, false, false],
             [false, false, false, false]]
  end

  def character_to_index
    {"A" => 0, "B" => 1, "C" => 2, "D" => 3}
  end

  def number_to_index
    {"1" => 0, "2" => 1, "3" => 2, "4" => 3}
  end

  def place_ship(pos_1, pos_2, pos_3 = false)

  end
end