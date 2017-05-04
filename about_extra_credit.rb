# EXTRA CREDIT:
#
# Create a program that will play the Greed Game.
# Rules for the game are in GREED_RULES.TXT.
#
# You already have a DiceSet class and score function you can use.
# Write a player class and a Game class to complete the project.  This
# is a free form assignment, so approach it however you desire.

require 'pp'

def score(dice)
  sortedDice = dice.sort
  totalScore = 0

  if (sortedDice.count == 0)
    return totalScore
  end
  
  if (sortedDice.count(1) >= 3)
    totalScore += 1000
    # At this point we know the first three elements are 1
    sortedDice = sortedDice.drop(3)
  end

  sortedDice.each do |roll|
    count = sortedDice.count(roll)
    if count >= 3
      totalScore += roll*100
      sortedDice.delete roll

      # We may have delete too many, so now lets add the extras
      (count - 3).times {sortedDice << roll }
    end
  end

  # At this point we have leftover 5's, 1's which we care about
  totalScore += sortedDice.count(1)*100
  totalScore += sortedDice.count(5)*50

  totalScore

end

class DiceSet
  attr_reader :values
  def initialize()
    @values = []
  end

  def roll(diceToRoll)
    @values = []
    diceToRoll.times { @values << rolldie }
  end

  def rolldie
    generateRandomNumber(1, 6)
  end

  def generateRandomNumber(min, max)
    rand(min..max)
  end

end

# Can use a class
# class Player
#   def initialize
    
#   end
# end

# But I am going to use a struct, feels more apt
Player = Struct.new(:name, :score)


class Game
  DICE_COUNT = 5
  attr_reader :listOfPlayers
  attr_reader :round
  attr_reader :dice
  attr_reader :currentPlayer

  def initialize(players)
    @listOfPlayers = []
    @round = 0
    @currentPlayer = 0
    
    # A game gets its own set of dice
    @dice = DiceSet.new

    # Instantiate a new player for every player
    # in the game
    players.times do |index|
      @listOfPlayers << Player.new(index, 0)
    end
  end

  def passDice
    @currentPlayer = @currentPlayer + 1
    if @currentPlayer > (@listOfPlayers.size - 1)
      @currentPlayer = 0
    end
  end

  def play
    roundScore = 0
    loop do
      pp @listOfPlayers
      puts "Current player is #{@currentPlayer}"
      @dice.roll(DICE_COUNT)
      roll = @dice.values
      rollScore = score(roll)
      if rollScore == 0
         puts "Sorry player #{@currentPlayer} you lost your round score of a #{roundScore}"
        roundScore = 0
        passDice
        next
      end

      roundScore = roundScore + rollScore
      puts "Current player #{@currentPlayer} rolled a #{rollScore} with round score of #{roundScore}"

      puts "Want to re-roll? [Y/n]"
      reroll = gets.chomp
      if reroll == "n"
        puts "Round score #{roundScore} added for #{@currentPlayer}"
        if @listOfPlayers[@currentPlayer].score >= 300
          @listOfPlayers[@currentPlayer].score += roundScore
        elsif roundScore >= 300
          @listOfPlayers[@currentPlayer].score += roundScore
        end
        roundScore = 0
        @round = @round + 1
        passDice

      elsif reroll == "Y"
        next
      end
    end

  end
end

Game.new(5).play