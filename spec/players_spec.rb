require 'rspec'
require_relative '../lib/game_elements/players'
require_relative '../lib/game_elements/board'
require 'rainbow'

describe Player do
  subject(:dummy) { Player.new('Major Zero') }
  let(:board) { Board.new }
  describe '#insert_x' do
    it 'updates board with chosen input' do
      expect { dummy.insert_x(board, '1') }.to change {
        board.quads
      }.to([Rainbow('X').color(:whitesmoke).to_s, '2', '3', '4', '5', '6', '7', '8', '9'])
    end

    context 'when input is invalid' do
      before do
        allow(dummy).to receive(:gets).and_return('billybob', '1')
      end
      it 'should cycle through two invalid inputs' do
        expect(dummy).to receive(:gets).exactly(2).times
        dummy.insert_x(board, '10')
      end
    end
  end

  describe '#initiate_color' do
    context 'when invalid inputs are put in' do
      before do
        allow(dummy).to receive(:gets).and_return('billybob', 'jimbob', 'red')
      end

      it 'updates player color' do
        expect { dummy.initiate_color }.to change { dummy.player_color }.from('white').to('red')
      end
      it 'should cycle through two invalid inputs' do
        expect(dummy).to receive(:gets).exactly(3).times
        dummy.initiate_color
      end
    end
  end
end
