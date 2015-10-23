#Rock paper scissors using OOP
class Players
  include Comparable
  
  attr_accessor :choice

  def <=>(other_hand)
    if self.choice == other_hand.choice
      0
    elsif (self.choice == 'r' && other_hand.choice == 's') || (self.choice == 's' && other_hand.choice == 'p') ||  
    (self.choice == 'p' && other_hand.choice == 'r')
      1
    else
      -1
    end
  end

end

class Player1 < Players

  def choose_hand
    puts "Choose: r, p, or s."
    self.choice= gets.chomp.downcase
    until Game::CHOICES.keys.include?(choice)
      puts "You must select r, p or s."
      self.choice = gets.chomp.downcase
    end
  end 

end

class Computer < Players

  def choose_hand
    self.choice= Game::CHOICES.keys.sample
  end

end

class Game < Players
  CHOICES = {'r' => 'Rock', 'p' => 'Paper', 's' => 'Scissors'}
  attr_accessor :player, :computer
  
  def initialize
    @player = Player1.new
    @computer = Computer.new
    puts "Let's play Rock, Paper, Scissors!"
  end

  def play
    player.choose_hand
    computer.choose_hand
    display_hand(player, computer)
    compare_with
    play_again
  end

   def compare_with
    if player.choice == computer.choice
      puts "It's a tie."
    elsif player.choice > computer.choice
      puts "Congrats you won!"
    else
      puts "Computer won."
    end
  end

  def display_hand(player_hand, computer_hand)
    puts "You chose #{CHOICES[player_hand.choice]} and the Computer chose #{CHOICES[computer_hand.choice]}."
  end

  def play_again
    puts "Would you like to play again? (Y/N)"
      answer = gets.chomp.downcase
      unless answer == 'n'
      self.play
    end
  end

end

Game.new.play