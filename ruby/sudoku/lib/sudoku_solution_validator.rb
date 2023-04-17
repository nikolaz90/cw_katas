require_relative 'valid'
class Sudoku
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
    ans = []
    ranges.each { |range| ans << @grid.map { |j| j[range] }[0..2] }
    ranges.each { |range| ans << @grid.map { |j| j[range] }[3..5] }
    ranges.each { |range| ans << @grid.map { |j| j[range] }[6..8] }
    ans
  end
end
