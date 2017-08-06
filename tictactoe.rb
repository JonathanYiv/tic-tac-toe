class TicTacToe
  attr_accessor :player1, :player2, :gameboard, :player1turn

  def initialize
  	puts "Starting a Game of Tic Tac Toe!"
  	@player1 = Player.new(1)
  	@player2 = Player.new(2)
  	@gameboard = GameBoard.new
  	@player1turn = true
  	instructions
  	play
  end

  def instructions
  	puts "Instructions:"
  	puts "The game will prompt you when it is your turn."
  	puts "Each position on the Tic-Tac-Toe board is represented by a letter A through I."
  	puts "Type in the letter corresponding to the area you wish to mark."
  	puts "\n\nLet's begin then, #{@player1.name} and #{@player2.name}!\n\n"
  end

  def play
  	while gameboard.win == false
  		next_turn
  		switch_turns
  	end
  	someone_won
  end

  def switch_turns
  	@player1turn = !@player1turn
  end

  def next_turn
  	@player1turn ? @gameboard.update_with(player1.turn, @player1turn) : @gameboard.update_with(player2.turn)
  end

  def someone_won
  	puts @player1turn ? "#{player2.name} has won! Suck it, #{player1.name}!" : "#{player1.name} has won! Suck it, #{player2.name}!"
  end


  class Player
  	attr_accessor :name

    def initialize(number)
      print "Hello, Player #{number}! What should we call you?\n> "
      @name = gets.chomp
      puts "\n"
    end

    def turn
      puts "It's #{name}'s turn now!"
      print "Which position do you want to mark?\n> "
      position = gets.chomp.downcase
      while !position.match(/^[a-i]$/)
      	print "Try again! That is not an acceptable input!\n> "
      	position = gets.chomp
      end
      puts "\n"
      position
    end
  end

  class GameBoard
  	attr_accessor :values, :win

  	def initialize
  	  @values = %w(a b c d e f g h i)
  	  @win = false
  	  display
  	end

  	def display
  	  @values.each_with_index do |value, index|	
  	    if index % 3 == 2
  	      print index == @values.length - 1 ? "#{value}\n" : "#{value}\n----------\n"
  	    else
  	      print "#{value} | "
  	    end
  	  end
  	  print "\n\n"
  	  check_for_win
  	end

  	def update_with(position, turn=false)
  	  @values.each_with_index do |value, index|
  	  	if value == position 
  	  	  @values[index] = turn ? "X" : "O"
  	  	  display
  	  	end 
  	  end
  	end

  	def check_for_win
  	  # 0,1,2 and 3,4,5 and 6,7,8 and 0,3,6 and 1,4,7 and 2,5,8 and 0,4,8 and 2,4,6
  	  @win = true if values[0] == values[1] && values[1] == values[2]
  	  @win = true if values[3] == values[4] && values[4] == values[5]
  	  @win = true if values[6] == values[7] && values[7] == values[8]
  	  @win = true if values[0] == values[3] && values[3] == values[6]
  	  @win = true if values[1] == values[4] && values[4] == values[7]
  	  @win = true if values[2] == values[5] && values[5] == values[8]
  	  @win = true if values[0] == values[4] && values[4] == values[8]
  	  @win = true if values[2] == values[4] && values[4] == values[6]
  	end
  end
end

game = TicTacToe.new








=begin
Class Tic-Tac-Toe
	Class GameBoard
		initialize method that creates two players
		display method that uses the @instancevariables to help display, checks for win conditions
		9 @instancevariables for each position
		change method that lets the player change an @instance variable
		winning method that is called by the display method if win conditions are met, displays the victory board, tells players the game is done (by setting their turn boolean to false)
	Class Player
		initialize method that prompts the player for their name
		@instancevariable regarding whether it is the player's turn
		@@classvariable to track the number of players
=end


