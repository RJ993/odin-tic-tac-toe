class Board
  attr_accessor :quads, :tic_tac_toe_board

  def initialize
    @quads = %w[1 2 3 4 5 6 7 8 9]
    @tic_tac_toe_board = "#{@quads[0]} | #{@quads[1]} | #{@quads[2]}
---------
#{@quads[3]} | #{@quads[4]} | #{@quads[5]}
---------
#{@quads[6]} | #{@quads[7]} | #{@quads[8]}"
  end

  def refresh_board
    self.tic_tac_toe_board = "#{@quads[0]} | #{@quads[1]} | #{@quads[2]}
---------
#{@quads[3]} | #{@quads[4]} | #{@quads[5]}
---------
#{@quads[6]} | #{@quads[7]} | #{@quads[8]}"
    puts tic_tac_toe_board
  end

  def restart_board
    @quads = %w[1 2 3 4 5 6 7 8 9]
    @tic_tac_toe_board = "#{@quads[0]} | #{@quads[1]} | #{@quads[2]}
---------
#{@quads[3]} | #{@quads[4]} | #{@quads[5]}
---------
#{@quads[6]} | #{@quads[7]} | #{@quads[8]}"
  end
end
