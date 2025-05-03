require_relative 'lib/game_mechanics'
require_relative 'lib/game_elements/players'
require_relative 'lib/game_elements/board'
require 'colorize'

people = 'open'

puts 'Who is going to be the Xs?'
x_player = Player.new(gets.chomp, false, false)
puts 'Who is going to be the Os?'
o_player = Player.new(gets.chomp, false, false)

while people == 'open'
  squares_occupied = 0

  x_player.first = false
  o_player.first = false
  x_player.winner = false
  o_player.winner = false

  first?(x_player, o_player)

  board = Board.new(" 1 | 2 | 3 \n --------- \n 4 | 5 | 6 \n --------- \n 7 | 8 | 9 ")
  puts board.tic_tac_toe_board

  while x_player.winner == false && o_player.winner == false && squares_occupied < 9
    if x_player.first == true
      puts 'Where would you like to put your X?'
      insert_x(board, gets.chomp)
      squares_occupied += 1
      current_stats(board, x_player, o_player)
      if x_player.winner == false && o_player.winner == false && squares_occupied < 9
        puts 'Where would you like to put your O?'
        insert_o(board, gets.chomp)
        current_stats(board, x_player, o_player)
      end
    end
    if o_player.first == true
      puts 'Where would you like to put your O?'
      insert_o(board, gets.chomp)
      squares_occupied += 1
      current_stats(board, x_player, o_player)
      if x_player.winner == false && o_player.winner == false && squares_occupied < 9
        puts 'Where would you like to put your X?'
        insert_x(board, gets.chomp)
        current_stats(board, x_player, o_player)
      end
    end
    squares_occupied += 1
  end

  declare_winner(x_player, o_player)
  puts 'Do you want to play again?'
  answer = gets.chomp
  people == 'close' if answer == no
end
