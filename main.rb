require_relative 'lib/game_mechanics'
require_relative 'lib/game_elements/players'
require_relative 'lib/game_elements/board'
require 'rainbow'

people = 'open'
game = Game.new

while people == 'open'
  game.refresh_stats
  game.first?
  game.play
  game.declare_winner
  puts Rainbow('Do you want to play again? Y or N.').color(:aquamarine)
  answer = gets.chomp.downcase
  people = 'close' if answer == 'n'
end
