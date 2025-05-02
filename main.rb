require_relative 'lib/game_mechanics.rb'
require_relative 'lib/game_elements/players.rb'
require_relative 'lib/game_elements/board.rb'

people = 'open'


puts 'Who is going to be the Xs?'
x_player = Player.new(gets.chomp, false, false)
puts 'Who is going to be the Os?'
o_player = Player.new(gets.chomp, false, false)


while people == 'open'

  x_player.first = false
  o_player.first = false

  first?(x_player, o_player)

  board = Board.new(" 1 | 2 | 3 \n --------- \n 4 | 5 | 6 \n --------- \n 7 | 8 | 9 ")
  puts board.tic_tac_toe_board

  while x_player.winner == false && o_player.winner == false
    if x_player.first == true
      puts 'Where would you like to put your X?'
      insert_x(board, gets.chomp)
      current_stats(board, x_player, o_player)
      puts 'Where would you like to put your O?'
      insert_o(board, gets.chomp)
    end
    if o_player.first == true
      puts 'Where would you like to put your O?'
      insert_o(board, gets.chomp)
      current_stats(board, x_player, o_player)
      puts 'Where would you like to put your X?'
      insert_x(board, gets.chomp)
    end
    current_stats(board, x_player, o_player)
  end
  people = 'close'
end