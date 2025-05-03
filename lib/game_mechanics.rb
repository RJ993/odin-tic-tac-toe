require_relative 'game_elements/board'
require_relative 'game_elements/players'

def first?(x_player, o_player)
  puts "Who is going first? #{x_player.name} or #{o_player.name}?"
  first_player = gets.chomp
  until first_player == x_player.name || first_player == o_player.name
    puts 'Not a player. Try again'
    first_player = gets.chomp
  end
  if first_player == x_player.name
    x_player.make_first
  else
    o_player.make_first
  end
end

def insert_o(board, input)
  until board.tic_tac_toe_board.include?(input) && input != 'X' && input != '|' && input != '-' && input != ' '
    puts 'It is not an acceptable input. Put the number indicating where you want to put your O.'
    input = gets.chomp
  end
  board.tic_tac_toe_board.gsub!(input, 'O')
end

def insert_x(board, input)
  until board.tic_tac_toe_board.include?(input) && input != 'O' && input != '|' && input != '-' && input != ' '
    puts 'It is not an acceptable input. Put the number indicating where you want to put your X.'
    input = gets.chomp
  end
  board.tic_tac_toe_board.gsub!(input, 'X')
end

def current_stats(board, x_player, o_player)
  puts board.tic_tac_toe_board
  determine_winner(board, x_player, o_player)
end

def determine_winner(board, x_player, o_player)
  flattened_board = board.tic_tac_toe_board.delete("\n")
  simplified_board = flattened_board.delete('| -')
  look_at_diagonals(simplified_board, x_player, o_player)
  look_at_rows(simplified_board, x_player, o_player)
  look_at_columns(simplified_board, x_player, o_player)
end

def look_at_diagonals(board, x_player, o_player)
  if (board[0] == 'X' && board[4] == 'X' && board[8] == 'X') || (board[2] == 'X' && board[4] == 'X' && board[6] == 'X')
    x_player.make_winner
  end
  if (board[0] == 'O' && board[4] == 'O' && board[8] == 'O') || (board[2] == 'O' && board[4] == 'O' && board[6] == 'O')
    o_player.make_winner
  end
end

def look_at_columns(board, x_player, o_player)
  if (board[0] == 'X' && board[3] == 'X' && board[6] == 'X') || (board[1] == 'X' && board[4] == 'X' && board[7] == 'X') || (board[2] == 'X' && board[5] == 'X' && board[8] == 'X')
    x_player.make_winner
  end
  if (board[0] == 'O' && board[3] == 'O' && board[6] == 'O') || (board[1] == 'O' && board[4] == 'O' && board[7] == 'O') || (board[2] == 'O' && board[5] == 'O' && board[8] == 'O')
    o_player.make_winner
  end
end

def look_at_rows(board, x_player, o_player)
  if (board[0] == 'X' && board[1] == 'X' && board[2] == 'X') || (board[3] == 'X' && board[4] == 'X' && board[5] == 'X') || (board[6] == 'X' && board[7] == 'X' && board[8] == 'X')
    x_player.make_winner
  end
  if (board[0] == 'O' && board[1] == 'O' && board[2] == 'O') || (board[3] == 'O' && board[4] == 'O' && board[5] == 'O') || (board[6] == 'O' && board[7] == 'O' && board[8] == 'O')
    o_player.make_winner
  end
end

def declare_winner(x_player, o_player)
  puts "#{x_player.name} is the winner!!!" if x_player.winner == true
  puts "#{o_player.name} is the winner!!!" if o_player.winner == true
  return unless x_player.winner == false && o_player.winner == false

  puts 'Draw!!!'
end
