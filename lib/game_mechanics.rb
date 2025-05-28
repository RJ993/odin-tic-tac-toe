require_relative 'game_elements/board'
require_relative 'game_elements/players'
require 'rainbow'

class Game
  attr_accessor :winning_combos, :board, :x_player, :o_player, :squares_occupied

  def initialize
    @winning_combos = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ]
    @board = Board.new
    puts Rainbow('Who is going to be the Xs?').color(:aquamarine)
    @x_player = Player.new(gets.chomp)
    puts Rainbow('Who is going to be the Os?').color(:aquamarine)
    @o_player = Player.new(gets.chomp)
    @squares_occupied = 0
    @x_player.initiate_color
    @o_player.initiate_color
  end

  def play
    while x_player.winner == false && o_player.winner == false && squares_occupied < 9
      x_then_o
      o_then_x
      @squares_occupied += 1
    end
  end

  def x_then_o
    return unless x_player.first == true

    puts Rainbow('Where would you like to put your X?').color(:aquamarine)
    x_player.insert_x(board, gets.chomp)
    @squares_occupied += 1
    current_stats
    return unless x_player.winner == false && o_player.winner == false && @squares_occupied < 9

    puts Rainbow('Where would you like to put your O?').color(:aquamarine)
    o_player.insert_o(board, gets.chomp)
    current_stats
  end

  def o_then_x
    return unless o_player.first == true

    puts Rainbow('Where would you like to put your O?').color(:aquamarine)
    o_player.insert_o(board, gets.chomp)
    @squares_occupied += 1
    current_stats
    return unless x_player.winner == false && o_player.winner == false && @squares_occupied < 9

    puts Rainbow('Where would you like to put your X?').color(:aquamarine)
    x_player.insert_x(board, gets.chomp)
    current_stats
  end

  def first?
    puts Rainbow("Who is going first? #{x_player.name} or #{o_player.name}?").color(:aquamarine)
    first_player = gets.chomp.downcase
    until first_player == x_player.name.downcase || first_player == o_player.name.downcase
      puts 'Not a player. Try again'
      first_player = gets.chomp.downcase
    end
    if first_player == x_player.name.downcase
      x_player.make_first
    else
      o_player.make_first
    end
  end

  def current_stats
    board.refresh_board
    determine_winner
  end

  def determine_winner
    winning_combos.each do |combo|
      x_player.make_winner if combo.all? { |index| board.quads[index] == x_player.color_the_input('X') } == true
      o_player.make_winner if combo.all? { |index| board.quads[index] == o_player.color_the_input('O') } == true
    end
  end

  def declare_winner
    puts Rainbow("#{x_player.name} is the winner!!!").color(:aquamarine) if x_player.winner == true
    puts Rainbow("#{o_player.name} is the winner!!!").color(:aquamarine) if o_player.winner == true
    return unless x_player.winner == false && o_player.winner == false

    puts Rainbow('Draw!!!').color(:aquamarine)
  end

  def refresh_stats
    board.restart_board
    x_player.first = false
    o_player.first = false
    x_player.winner = false
    o_player.winner = false
    @squares_occupied = 0
  end
end
