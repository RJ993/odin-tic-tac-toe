require_relative 'board'
require 'rainbow'

class Player
  attr_reader :name
  attr_accessor :first, :winner, :player_color

  def initialize(name)
    @name = name
    @first = false
    @winner = false
    @player_color = 'white'
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
    board.quads.insert(input.to_i - 1, color_the_input('O'))
  end

  def insert_x(board, input)
    until board.quads.include?(input) == true
      puts 'It is not an acceptable input. Put the number indicating where you want to put your X.'
      input = gets.chomp
    end
    board.quads.delete(input)
    board.quads.insert(input.to_i - 1, color_the_input('X'))
  end

  def initiate_color
    puts Rainbow("#{name}, what color would you like?").color(:aquamarine)
    puts Rainbow('You have the choices of red, blue, green, orange, purple, yellow, pink, or white').color(:aquamarine)
    chosen_color = gets.chomp.downcase
    until %w[red blue green orange purple yellow pink white].include?(chosen_color)
      puts 'Invalid color, try another'
      chosen_color = gets.chomp.downcase
    end
    self.player_color = chosen_color
  end

  def color_the_input(input)
    case player_color
    when 'red'
      Rainbow(input).color(:crimson)
    when 'blue'
      Rainbow(input).color(:navyblue)
    when 'green'
      Rainbow(input).color(:darkgreen)
    when 'orange'
      Rainbow(input).color(:orange)
    when 'purple'
      Rainbow(input).color(:purple)
    when 'yellow'
      Rainbow(input).color(:gold)
    when 'pink'
      Rainbow(input).color(:pink)
    when 'white'
      Rainbow(input).color(:whitesmoke)
    end
  end
end
