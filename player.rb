class Player
  def valid_guess?(pos)
    if !(pos[0].to_s =~ /\A[-+]?\d*\.?\d+\z/) || !(pos[1].to_s =~ /\A[-+]?\d*\.?\d+\z/)
      return false
    end

    if pos[0] < 0 || pos[0] > 3 || pos[1] < 0 || pos[1] > 3
      return false
    end

    true
  end

  def get_player_input
    p "Please enter the positition of the card you would like to flip (e.g., '3,1')"
    guess = gets.chomp.split(",").map { |num| num.to_i }
    while !(valid_guess?(guess))
      p "Please enter the positition of the card you would like to flip (e.g., '3,1')"
      guess = gets.chomp.split(",").map { |num| num.to_i }
    end
    guess
  end
end