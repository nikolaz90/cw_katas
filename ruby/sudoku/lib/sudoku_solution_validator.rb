# frozen_string_literal: true

require_relative 'valid'

class Sudoku
  RANGES = [(0..2), (3..5), (6..8)].freeze

  attr_reader :grid

  def self.done_or_not(grid)
    new(grid).valid? ? 'Finished!' : 'Try again!'
  end

  def initialize(grid)
    @grid = grid
  end

  alias rows grid

  def columns
    9.times.map { |i| @grid.map { |j| j[i] } }
  end

  def regions
    regs = []
    3.times do |i|
      RANGES.each do |range|
        regs << @grid.map { |j| j[range] }[RANGES[i]]
      end
    end
    regs
  end

  def valid?
    all_arrays.all?(&:valid?)
  end

  private

  def all_arrays
    rows + columns + regions.map(&:flatten)
  end
end
