require_relative 'game_elements/board.rb'
require_relative 'game_elements/players.rb'

def first?(x_player, o_player)
    puts "Who is going first? #{x_player.name} or #{o_player.name}?"
    first_player = gets.chomp
    until first_player == x_player.name || first_player == o_player.name
      puts "Not a player. Try again"
      first_player = gets.chomp
    end
    if first_player == x_player.name
      x_player.make_first
    else
      o_player.make_first
    end
end

def insert_o(board, input)
  until board.include?(input) && input != 'X' && input != '|' && input != '-' && input != ' '
    puts 'It is not an acceptable input. Put the number indicating where you want to put your O.'
    input = gets.chomp
  end
  board.gsub!(input, 'O')
end

def insert_x(board, input)
  until board.include?(input) && input != 'O' && input != '|' && input != '-' && input != ' '
    puts 'It is not an acceptable input. Put the number indicating where you want to put your X.'
    input = gets.chomp
  end
  board.gsub!(input, 'X')
end

def current_stats(board, x_player, o_player)
  puts board.tic_tac_toe_board
end