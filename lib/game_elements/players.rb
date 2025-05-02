class Player
attr_reader :name
attr_accessor :first, :winner
def initialize(name, first, winner)
    @name = name
    @first = first
    @winner = winner
end
def make_first
  self.first = true
end
def make_winner
  self.winner = true
end
end