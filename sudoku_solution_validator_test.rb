require_relative 'sudoku_solution_validator'
require 'minitest/autorun'

class SudokuTest < Minitest::Test
  def test_it_finds_rows
    grid = [[5, 3, 4, 6, 7, 8, 9, 1, 2],
            [6, 7, 2, 1, 9, 5, 3, 4, 8],
            [1, 9, 8, 3, 4, 2, 5, 6, 7],
            [8, 5, 9, 7, 6, 1, 4, 2, 3],
            [4, 2, 6, 8, 5, 3, 7, 9, 1],
            [7, 1, 3, 9, 2, 4, 8, 5, 6],
            [9, 6, 1, 5, 3, 7, 2, 8, 4],
            [2, 8, 7, 4, 1, 9, 6, 3, 5],
            [3, 4, 5, 2, 8, 6, 1, 7, 9]]
    assert_equal grid, Sudoku.new(grid).rows
  end

  def test_it_finds_columns
    # skip
    grid = [[5, 3, 4, 6, 7, 8, 9, 1, 2],
            [6, 7, 2, 1, 9, 5, 3, 4, 8],
            [1, 9, 8, 3, 4, 2, 5, 6, 7],
            [8, 5, 9, 7, 6, 1, 4, 2, 3],
            [4, 2, 6, 8, 5, 3, 7, 9, 1],
            [7, 1, 3, 9, 2, 4, 8, 5, 6],
            [9, 6, 1, 5, 3, 7, 2, 8, 4],
            [2, 8, 7, 4, 1, 9, 6, 3, 5],
            [3, 4, 5, 2, 8, 6, 1, 7, 9]]
    expected = [[5, 6, 1, 8, 4, 7, 9, 2, 3],
                [3, 7, 9, 5, 2, 1, 6, 8, 4],
                [4, 2, 8, 9, 6, 3, 1, 7, 5],
                [6, 1, 3, 7, 8, 9, 5, 4, 2],
                [7, 9, 4, 6, 5, 2, 3, 1, 8],
                [8, 5, 2, 1, 3, 4, 7, 9, 6],
                [9, 3, 5, 4, 7, 8, 2, 6, 1],
                [1, 4, 6, 2, 9, 5, 8, 3, 7],
                [2, 8, 7, 3, 1, 6, 4, 5, 9]]
    assert_equal expected, Sudoku.new(grid).columns
  end

  def test_it_finds_9_regions
    skip
    grid = [[5, 3, 4, 6, 7, 8, 9, 1, 2],
            [6, 7, 2, 1, 9, 5, 3, 4, 8],
            [1, 9, 8, 3, 4, 2, 5, 6, 7],
            [8, 5, 9, 7, 6, 1, 4, 2, 3],
            [4, 2, 6, 8, 5, 3, 7, 9, 1],
            [7, 1, 3, 9, 2, 4, 8, 5, 6],
            [9, 6, 1, 5, 3, 7, 2, 8, 4],
            [2, 8, 7, 4, 1, 9, 6, 3, 5],
            [3, 4, 5, 2, 8, 6, 1, 7, 9]]
    assert_equal 9, Sudoku.new(grid).regions.size
  end

  def test_it_finds_the_third_region
    skip
    grid = [[5, 3, 4, 6, 7, 8, 9, 1, 2],
            [6, 7, 2, 1, 9, 5, 3, 4, 8],
            [1, 9, 8, 3, 4, 2, 5, 6, 7],
            [8, 5, 9, 7, 6, 1, 4, 2, 3],
            [4, 2, 6, 8, 5, 3, 7, 9, 1],
            [7, 1, 3, 9, 2, 4, 8, 5, 6],
            [9, 6, 1, 5, 3, 7, 2, 8, 4],
            [2, 8, 7, 4, 1, 9, 6, 3, 5],
            [3, 4, 5, 2, 8, 6, 1, 7, 9]]
    expected = [9, 1, 2, 3, 4, 8, 5, 6, 7]
    assert_equal expected, Sudoku.new(grid).regions[2].flatten
  end

  def test_it_finds_the_forth_region
    skip
    grid = [[5, 3, 4, 6, 7, 8, 9, 1, 2],
            [6, 7, 2, 1, 9, 5, 3, 4, 8],
            [1, 9, 8, 3, 4, 2, 5, 6, 7],
            [8, 5, 9, 7, 6, 1, 4, 2, 3],
            [4, 2, 6, 8, 5, 3, 7, 9, 1],
            [7, 1, 3, 9, 2, 4, 8, 5, 6],
            [9, 6, 1, 5, 3, 7, 2, 8, 4],
            [2, 8, 7, 4, 1, 9, 6, 3, 5],
            [3, 4, 5, 2, 8, 6, 1, 7, 9]]
    expected = [8, 5, 9, 4, 2, 6,7, 1, 3]
    assert_equal expected, Sudoku.new(grid).regions[3].flatten
  end

  def test_forth_row_is_valid
    skip
    grid = [[5, 3, 4, 6, 7, 8, 9, 1, 2],
            [6, 7, 2, 1, 9, 5, 3, 4, 8],
            [1, 9, 8, 3, 4, 2, 5, 6, 7],
            [8, 5, 9, 7, 6, 1, 4, 2, 3],
            [4, 2, 6, 8, 5, 3, 7, 9, 1],
            [7, 1, 3, 9, 2, 4, 8, 5, 6],
            [9, 6, 1, 5, 3, 7, 2, 8, 4],
            [2, 8, 7, 4, 1, 9, 6, 3, 5],
            [3, 4, 5, 2, 8, 6, 1, 7, 9]]
    assert Sudoku.new(grid).rows[3].valid?
  end

  def test_forth_col_is_valid
    skip
    grid = [[5, 3, 4, 6, 7, 8, 9, 1, 2],
            [6, 7, 2, 1, 9, 5, 3, 4, 8],
            [1, 9, 8, 3, 4, 2, 5, 6, 7],
            [8, 5, 9, 7, 6, 1, 4, 2, 3],
            [4, 2, 6, 8, 5, 3, 7, 9, 1],
            [7, 1, 3, 9, 2, 4, 8, 5, 6],
            [9, 6, 1, 5, 3, 7, 2, 8, 4],
            [2, 8, 7, 4, 1, 9, 6, 3, 5],
            [3, 4, 5, 2, 8, 6, 1, 7, 9]]
    assert Sudoku.new(grid).columns[3].valid?
  end

  def test_third_region_is_valid
    skip
    grid = [[5, 3, 4, 6, 7, 8, 9, 1, 2],
            [6, 7, 2, 1, 9, 5, 3, 4, 8],
            [1, 9, 8, 3, 4, 2, 5, 6, 7],
            [8, 5, 9, 7, 6, 1, 4, 2, 3],
            [4, 2, 6, 8, 5, 3, 7, 9, 1],
            [7, 1, 3, 9, 2, 4, 8, 5, 6],
            [9, 6, 1, 5, 3, 7, 2, 8, 4],
            [2, 8, 7, 4, 1, 9, 6, 3, 5],
            [3, 4, 5, 2, 8, 6, 1, 7, 9]]
    assert Sudoku.new(grid).regions[2].valid?
  end

  def test_it_is_valid_grid
    skip
    grid = [[5, 3, 4, 6, 7, 8, 9, 1, 2],
            [6, 7, 2, 1, 9, 5, 3, 4, 8],
            [1, 9, 8, 3, 4, 2, 5, 6, 7],
            [8, 5, 9, 7, 6, 1, 4, 2, 3],
            [4, 2, 6, 8, 5, 3, 7, 9, 1],
            [7, 1, 3, 9, 2, 4, 8, 5, 6],
            [9, 6, 1, 5, 3, 7, 2, 8, 4],
            [2, 8, 7, 4, 1, 9, 6, 3, 5],
            [3, 4, 5, 2, 8, 6, 1, 7, 9]]
    assert_equal 'Finished!', Sudoku.done_or_not(grid)
  end

  def test_it_is_invalid_grid
    skip
    grid = [[5, 3, 4, 6, 7, 8, 9, 1, 2],
            [6, 7, 2, 1, 9, 0, 3, 4, 9],
            [1, 0, 0, 3, 4, 2, 5, 6, 0],
            [8, 5, 9, 7, 6, 1, 0, 2, 0],
            [4, 2, 6, 8, 5, 3, 7, 9, 1],
            [7, 1, 3, 9, 2, 4, 8, 5, 6],
            [9, 0, 1, 5, 3, 7, 2, 1, 4],
            [2, 8, 7, 4, 1, 9, 6, 3, 5],
            [3, 0, 0, 4, 8, 1, 1, 7, 9]]
    assert_equal 'Try again!', Sudoku.done_or_not(grid)
  end

  def test_it_is_another_valid_grid
    skip
    grid = [[1, 3, 2, 5, 7, 9, 4, 6, 8],
            [4, 9, 8, 2, 6, 1, 3, 7, 5],
            [7, 5, 6, 3, 8, 4, 2, 1, 9],
            [6, 4, 3, 1, 5, 8, 7, 9, 2],
            [5, 2, 1, 7, 9, 3, 8, 4, 6],
            [9, 8, 7, 4, 2, 6, 5, 3, 1],
            [2, 1, 4, 9, 3, 5, 6, 8, 7],
            [3, 6, 5, 8, 1, 7, 9, 2, 4],
            [8, 7, 9, 6, 4, 2, 1, 5, 3]]
    assert_equal 'Finished!', Sudoku.done_or_not(grid)
  end

  def test_it_is_another_invalid_grid_2
    skip
    grid = [[1, 3, 2, 5, 7, 9, 4, 6, 8],
            [4, 9, 8, 2, 6, 1, 3, 7, 5],
            [7, 5, 6, 3, 8, 4, 2, 1, 9],
            [6, 4, 3, 1, 5, 8, 7, 9, 2],
            [5, 2, 1, 7, 9, 3, 8, 4, 6],
            [9, 8, 7, 4, 2, 6, 5, 3, 1],
            [2, 1, 4, 9, 3, 5, 6, 8, 7],
            [3, 6, 5, 8, 1, 7, 9, 2, 4],
            [8, 7, 9, 6, 4, 2, 1, 3, 5]]
    assert_equal 'Try again!', Sudoku.done_or_not(grid)
  end


  def test_it_is_incomplete_invalid_grid
    skip
    grid = [[1, 3, 2, 5, 7, 9, 4, 6, 8],
            [4, 9, 8, 2, 6, 0, 3, 7, 5],
            [7, 0, 6, 3, 8, 0, 2, 1, 9],
            [6, 4, 3, 1, 5, 0, 7, 9, 2],
            [5, 2, 1, 7, 9, 0, 8, 4, 6],
            [9, 8, 0, 4, 2, 6, 5, 3, 1],
            [2, 1, 4, 9, 3, 5, 6, 8, 7],
            [3, 6, 0, 8, 1, 7, 9, 2, 4],
            [8, 7, 0, 6, 4, 2, 1, 3, 5]]
    assert_equal 'Try again!', Sudoku.done_or_not(grid)
  end


  def test_it_is_invalid_grid_with_repeated_diagonals
    skip
    grid = [[1, 2, 3, 4, 5, 6, 7, 8, 9],
            [2, 3, 4, 5, 6, 7, 8, 9, 1],
            [3, 4, 5, 6, 7, 8, 9, 1, 2],
            [4, 5, 6, 7, 8, 9, 1, 2, 3],
            [5, 6, 7, 8, 9, 1, 2, 3, 4],
            [6, 7, 8, 9, 1, 2, 3, 4, 5],
            [7, 8, 9, 1, 2, 3, 4, 5, 6],
            [8, 9, 1, 2, 3, 4, 5, 6, 7],
            [9, 1, 2, 3, 4, 5, 6, 7, 8]]
    assert_equal 'Try again!', Sudoku.done_or_not(grid)
  end


  def test_it_is_invalid_grid_with_invalid_number
    skip
    grid = [[5, 3, 4, 6, 7, 8, 9, 1, 2],
            [6, 7, 2, 1, 9, 0, 3, 4, 9],
            [1, 0, 0, 3, 4, 2, 5, 6, 0],
            [8, 5, 9, 7, 6, 1, 0, 2, 0],
            [4, 2, 6, 8, 5, 3, 7, 9, 1],
            [7, 1, 3, 9, 2, 4, 8, 5, 6],
            [9, 0, 1, 5, 3, 7, 2, 1, 4],
            [2, 8, 7, 4, 1, 9, 6, 3, 5],
            [0, 0, 0, 0, 0, 0, 0,0, 45]]
    assert_equal 'Try again!', Sudoku.done_or_not(grid)
  end
end
