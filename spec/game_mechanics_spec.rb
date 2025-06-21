require 'rspec'
require_relative '../lib/game_mechanics'
require_relative '../lib/game_elements/players'
require 'rainbow'

describe Game do
  subject(:game) { described_class.new }
  let(:test_board) { Board.new }
  let(:x_gar) { Player.new('Garfield') }
  let(:o_ode) { Player.new('Odie') }

  describe '#play' do
    context 'when x is first' do
      before do
        game.instance_variable_set(:@x_player, x_gar)
        game.instance_variable_set(:@o_player, o_ode)
        x_gar.make_first
        allow(x_gar).to receive(:gets).and_return('1', '2', '3')
        allow(o_ode).to receive(:gets).and_return('4', '5')
      end
      it 'calls x_then_o at least once' do
        expect(game).to receive(:x_then_o).at_least(1).time
        game.play
      end

      it 'does NOT call o_then_x' do
        expect(game).to receive(:o_then_x).exactly(0).times
        game.play
      end

      it 'should have 5 squares occupied by the end of the game' do
        expect { game.play }.to change { game.squares_occupied }.from(0).to(5)
      end
    end
  end

  describe '#x_then_o' do
    context 'when x has won after last input' do
      before do
        game.instance_variable_set(:@board, test_board)
        game.instance_variable_set(:@x_player, x_gar)
        game.instance_variable_set(:@o_player, o_ode)
        allow(x_gar).to receive(:gets).and_return('3')
        allow(o_ode).to receive(:gets).and_return('7')
        test_board.instance_variable_set(:@quads,
                                         [Rainbow('X').color(:whitesmoke).to_s, Rainbow('X').color(:whitesmoke).to_s,
                                          '3', 'O', 'O', '6', '7', '8', '9'])
      end

      it 'calls insert_x once' do
        expect(x_gar).to receive(:insert_x).exactly(1).time
        game.x_then_o
      end

      it 'does NOT calls insert_o' do
        expect(o_ode).to receive(:insert_o).exactly(0).times
        game.x_then_o
      end

      it 'increments squares_occupied once' do
        expect { game.x_then_o }.to change { game.squares_occupied }.from(0).to(1)
      end
    end
  end

  describe '#first?' do
    context 'when player X\'s name is the first and only valid input' do
      before do
        game.instance_variable_set(:@x_player, x_gar)
        game.instance_variable_set(:@o_player, o_ode)
        allow(game).to receive(:gets).and_return('Garfield')
      end
      it 'makes x_player first' do
        expect { game.first? }.to change { x_gar.first }.from(false).to(true)
      end
    end

    context 'when player O\'s name is the third input after two invalid inputs' do
      before do
        game.instance_variable_set(:@x_player, x_gar)
        game.instance_variable_set(:@o_player, o_ode)
        allow(game).to receive(:gets).and_return('Nicodemus', 'Lex', 'Odie')
      end
      it 'makes o_player first' do
        expect { game.first? }.to change { o_ode.first }.from(false).to(true)
      end

      it 'cycles through 3 inputs' do
        expect(game).to receive(:gets).exactly(3).times
        game.first?
      end
    end
  end

  describe '#determine_winner' do
    context 'when x has a winning combination' do
      before do
        game.instance_variable_set(:@board, test_board)
        game.instance_variable_set(:@x_player, x_gar)
        game.instance_variable_set(:@o_player, o_ode)
        test_board.instance_variable_set(:@quads,
                                         [Rainbow('X').color(:whitesmoke).to_s, Rainbow('X').color(:whitesmoke).to_s,
                                          Rainbow('X').color(:whitesmoke).to_s, '4', '5', '6', '7', '8', '9'])
      end

      it 'determines x the winner' do
        expect { game.determine_winner }.to change { x_gar.winner }.from(false).to(true)
      end

      it 'does NOT determines o the winner' do
        expect(o_ode.winner).to be false
        game.determine_winner
      end
    end

    context 'when nobody has a winning combination' do
      before do
        game.instance_variable_set(:@board, test_board)
        game.instance_variable_set(:@x_player, x_gar)
        game.instance_variable_set(:@o_player, o_ode)
        test_board.instance_variable_set(:@quads,
                                         [Rainbow('X').color(:whitesmoke).to_s, Rainbow('X').color(:whitesmoke).to_s,
                                          '3', '4', '5', '6', '7', '8', '9'])
      end

      it 'does NOT determines x the winner' do
        expect(x_gar.winner).to be false
        game.determine_winner
      end

      it 'does NOT determines o the winner' do
        expect(o_ode.winner).to be false
        game.determine_winner
      end
    end
  end
end
