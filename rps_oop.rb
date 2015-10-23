#Asks for the players name. The player picks rock paper or scissors. 
#The computer then picks. The two hands are compared. Then the winnder is 
#announced. Ask player if he wants to play again? Repeat until No. 


class Hand
  
  include Comparable
  
  attr_accessor :choice
  
  CHOICES = ['rock', 'paper', 'scissors']

  def <=>(other_hand)
    if self.choice == other_hand.choice
      0
    elsif (self.choice == 'rock' && other_hand.choice == 'scissors') || (self.choice == 'scissors' && other_hand.choice == 'paper') || 
    (self.choice == 'paper' && other_hand.choice == 'rock')
      1
    else
      -1
    end
  end

  def compare_hands(computer)
    if self.choice > computer.choice
      p "You win"
    elsif self.choice == computer.choice
      p "It's a tie"
    else
      p "You lost"
    end
  end

  def display_choice
    puts "Computer chose #{self.choice}"
  end

end

class PlayerHand < Hand
  attr_accessor :choice
  
  def choose
    puts "Choose rock, paper, or scissors"
    self.choice = gets.chomp.downcase
    until Hand::CHOICES.include?(choice)
      puts "You must choose Rock, paper, or scissors."
      self.choice= gets.chomp.downcase
    end
    return choice
  end

end

class ComputerHand < Hand
  attr_accessor :choice
  def choose
    self.choice= Hand::CHOICES.sample 
  end
end

class Game
  attr_accessor :player, :computer

  def initialize
    @player = PlayerHand.new
    @computer = ComputerHand.new
  end

  def play
    player.choose
    computer.choose
    computer.display_choice
    player.compare_hands(computer)
    play_again?
  end

  def play_again?
    puts "Do you want to play again? Press enter to play and 'no' to exit"
    play_again = gets.chomp.downcase
    until play_again == 'no'
      Game.new.play
      puts "Do you want to play again? Press enter to play and'no' to exit"
      play_again = gets.chomp.downcase
    end     
  end

end

Game.new.play


