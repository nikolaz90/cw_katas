require_relative 'valid'
class Sudoku
  attr_reader :grid

  def self.done_or_not(grid)
    new(grid).is_valid? ? 'Finished!' : 'Try again!'
  end

  def initialize(grid)
    @grid = grid
  end

  alias rows grid

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

  def is_valid?
    all_arrays.each { |array| return false unless array.valid? }
    true
  end

  private

  def all_arrays
    rows + columns + regions.map(&:flatten)
  end
end
