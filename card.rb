class Card
  attr_accessor :rank, :suit

  def initialize(rank, suit)
    self.rank = rank
    self.suit = suit
  end

  def output_card
    puts "#{self.rank} of #{self.suit}"
  end

  def self.random_card
    Card.new(rand(10), :spades)
  end
end
 
class Deck
  def initialize
    @cards = []
    @cards << Card.new(10, :spades)
    @cards << Card.new(9, :dimonds)
  end
  
  def shuffle
    @cards.shuffle!
  end
 
  def deal (number)
    number.times do 
      current_card = @cards.shift
      if current_card.nil?
        return 
      end
      current_card.output_card
    end 
  end
end
 
deck = Deck.new
deck.shuffle
deck.deal (2)