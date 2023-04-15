class Sudoku
  attr_reader :rows
  @@valid_range = (0..9).to_a

  def initialize(grid)
    @rows = grid
  end
end
