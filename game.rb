require_relative 'card'
require_relative 'board'
require_relative 'player'

class Game
  def initialize
    @player = Player.new
    @prev_guess = []
    @board = Board.new()
  end

  def is_card_playable?(pos)
    @board.grid[pos[0]][pos[1]].face_up == false
  end

  def make_guess
    pos = @player.get_player_input

    while !self.is_card_playable?(pos)
      pos = @player.get_player_input
    end

    card = @board.grid[pos[0]][pos[1]]
    prev_row = @prev_guess[0]
    prev_col = @prev_guess[1]


    card.reveal

    if prev_row == nil
      @prev_guess = pos
    else
      @prev_guess = [nil, nil]
      prev_card = @board.grid[prev_row][prev_col]
      is_match?(prev_card, card)
    end
  end

  def is_match?(prev, curr)
    system("clear")
    @board.print_board
    if prev.value == curr.value
      p "It's a match!"
      sleep(2)
    else
      p "Try again"
      prev.hide
      curr.hide
      sleep(2)
    end
  end


  def play
    system("clear")
    @board.set_grid

    while !(@board.won?)
      @board.print_board
      self.make_guess
      system("clear")
    end

    @board.print_board
    p "Congratulations! You have won the game!"
  end
end

if $PROGRAM_NAME == __FILE__
  game = Game.new

  game.play
end