require "tictactoe"

describe TicTacToe do
	subject(:ttt) { TicTacToe.new("Jonathan", "Cesilia") }

	describe "player names" do
		it "receives name input" do
			expect(ttt.player1.name).to eq("Jonathan")
			expect(ttt.player2.name).to eq("Cesilia")
		end
	end

	describe "gameboard win scenarios" do
		it "evaluates win in top row" do
			ttt.gameboard.values[0] = "X"
			ttt.gameboard.values[1] = "X"
			ttt.gameboard.values[2] = "X"
			ttt.gameboard.check_for_win
			expect(ttt.gameboard.win).to be true
		end

		it "evaluates win in middle row" do
			ttt.gameboard.values[3] = "X"
			ttt.gameboard.values[4] = "X"
			ttt.gameboard.values[5] = "X"
			ttt.gameboard.check_for_win
			expect(ttt.gameboard.win).to be true
		end

		it "evaluates win in bottom row" do
			ttt.gameboard.values[6] = "X"
			ttt.gameboard.values[7] = "X"
			ttt.gameboard.values[8] = "X"
			ttt.gameboard.check_for_win
			expect(ttt.gameboard.win).to be true
		end

		it "evaluates win in left column" do
			ttt.gameboard.values[0] = "X"
			ttt.gameboard.values[3] = "X"
			ttt.gameboard.values[6] = "X"
			ttt.gameboard.check_for_win
			expect(ttt.gameboard.win).to be true
		end

		it "evaluates win in middle column" do
			ttt.gameboard.values[1] = "X"
			ttt.gameboard.values[4] = "X"
			ttt.gameboard.values[7] = "X"
			ttt.gameboard.check_for_win
			expect(ttt.gameboard.win).to be true
		end

		it "evaluates win in right column" do
			ttt.gameboard.values[2] = "X"
			ttt.gameboard.values[5] = "X"
			ttt.gameboard.values[8] = "X"
			ttt.gameboard.check_for_win
			expect(ttt.gameboard.win).to be true
		end

		it "evaluates win in right diagonal" do
			ttt.gameboard.values[2] = "X"
			ttt.gameboard.values[4] = "X"
			ttt.gameboard.values[6] = "X"
			ttt.gameboard.check_for_win
			expect(ttt.gameboard.win).to be true
		end

		it "evaluates win in middle column" do
			ttt.gameboard.values[0] = "X"
			ttt.gameboard.values[4] = "X"
			ttt.gameboard.values[8] = "X"
			ttt.gameboard.check_for_win
			expect(ttt.gameboard.win).to be true
		end
	end

	describe "gameboard turn switching mechanism" do
		it "switches turns" do
			ttt.switch_turns
			expect(ttt.player1turn).to be false
		end
	end

	describe "input mechanism" do
		it "accepts a new position and updates the board" do
			ttt.gameboard.update_with("c")
			expect(ttt.gameboard.values).to eq(["a","b","O", "d", "e", "f", "g", "h", "i"])
		end
	end

	describe "mock functionality" do
		it "receives a method stub and returns accordingly" do
			test_double = double
			allow(test_double).to receive(:testing).and_return("This is a double object with a method stub.")
			expect(test_double.testing).to eq("This is a double object with a method stub.")
		end
	end
end