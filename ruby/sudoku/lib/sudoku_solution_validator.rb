class Sudoku
  @@valid_range = (0..9).to_a

  def initialize(grid)
    @grid = grid
  end

  def rows
    @grid
  end
end
