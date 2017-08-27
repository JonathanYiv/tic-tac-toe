require_relative "tictactoe.rb"

def get_player_name(number)
  print "Hello, Player #{number}! What should we call you?\n> "
  @name = gets.chomp
  puts "\n"
  @name
end

puts "Starting a Game of Tic Tac Toe!"
game = TicTacToe.new(get_player_name(1), get_player_name(2))
game.play