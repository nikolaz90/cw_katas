class Sudoku
  @@valid_range = (0..9)

  def initialize(grid)
    @grid = grid
  end

  def rows
    @grid
  end

  def columns
    9.times.map { |i| @grid.map { |j| j[i] } }
  end

  def regions
    ranges = [(0..2), (3..5), (6..8)]
    step_2 = ranges.map { |i| @grid.map { |j| j[i] }.first(3) }
  end
end
