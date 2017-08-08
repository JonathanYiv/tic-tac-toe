class TicTacToe
  attr_accessor :player1, :player2, :gameboard, :player1turn

  def initialize(name1, name2)
  	@player1 = Player.new(name1)
  	@player2 = Player.new(name2)
  	@gameboard = GameBoard.new
  	@player1turn = true
  end

  def play
  	instructions
  	start
  end

  def instructions
  	puts "Instructions:"
  	puts "The game will prompt you when it is your turn."
  	puts "Each position on the Tic-Tac-Toe board is represented by a letter A through I."
  	puts "Type in the letter corresponding to the area you wish to mark."
  	puts "\n\nLet's begin then, #{@player1.name} and #{@player2.name}!\n\n"
  end

  def start
  	turns = 0
  	while gameboard.win == false && turns < 9
  		next_turn
  		switch_turns
  		gameboard.check_for_win
  		turns += 1
  	end
  	turns > 8 ? draw : someone_won
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

  def draw
  	puts "It's a draw. You both suck! Haha!"
  end


  class Player
  	attr_accessor :name, :selected_values

    def initialize(name)
      @name = name
      @@selected_values = []
    end

    def turn
      prompt
      get_position
    end

    def prompt
      puts "It's #{name}'s turn now!"
      print "Which position do you want to mark?\n> "
    end

    def get_position
      position = gets.chomp.downcase
      while !position.match(/^[a-i]$/) || @@selected_values.include?(position)
      	print "Try again! That is not an acceptable input!\n> "
      	position = gets.chomp.downcase
      end
      puts "\n"
      @@selected_values << position
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




def get_player_name(number)
      print "Hello, Player #{number}! What should we call you?\n> "
      @name = gets.chomp
      puts "\n"
      @name
end


puts "Starting a Game of Tic Tac Toe!"
game = TicTacToe.new(get_player_name(1), get_player_name(2))
game.play
