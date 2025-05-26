require_relative 'lib/game_mechanics'
require_relative 'lib/game_elements/players'
require_relative 'lib/game_elements/board'
require 'colorize'

people = 'open'
game = Game.new

while people == 'open'
  game.refresh_stats
  game.first?
  game.play
  game.declare_winner
  puts 'Do you want to play again? Y or N.'
  answer = gets.chomp.downcase
  people = 'close' if answer == 'n'
end
