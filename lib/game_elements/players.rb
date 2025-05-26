require_relative 'board'

class Player
  attr_reader :name
  attr_accessor :first, :winner

  def initialize(name)
    @name = name
    @first = false
    @winner = false
  end

  def make_first
    self.first = true
  end

  def make_winner
    self.winner = true
  end

  def insert_o(board, input)
    until board.quads.include?(input) == true
      puts 'It is not an acceptable input. Put the number indicating where you want to put your O.'
      input = gets.chomp
    end
    board.quads.delete(input)
    board.quads.insert(input.to_i - 1, 'O')
  end

  def insert_x(board, input)
    until board.quads.include?(input) == true
      puts 'It is not an acceptable input. Put the number indicating where you want to put your X.'
      input = gets.chomp
    end
    board.quads.delete(input)
    board.quads.insert(input.to_i - 1, 'X')
  end
end
