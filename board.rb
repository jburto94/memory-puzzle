require_relative 'card'

class Board
  attr_reader :grid
  
  def initialize
    @grid = Array.new(4) { Array.new(4) }
    @top = "  0 1 2 3"
  end

  def set_grid
    values = ["A", "A", "S", "S", "D", "D", "F", "F", "G", "G", "H", "H", "J", "J", "K", "K"].shuffle
    (0..3).each do |row|
      val_row = (row % 4) * 4
      (0..3).each do |col|
        @grid[row][col] = Card.new(values[val_row + col])
      end
    end
  end

  def print_board
    print "#{@top}\n"
    (0..3).each do |line|
      print line
      @grid[line].each do |card|
        if card.face_up
          print " #{card.value}"
        else
          print "  "
        end
      end
      print "\n"
    end
  end

  def won?
    cards = @grid.flatten
    cards.all? { |card| card.face_up == true }
  end
end