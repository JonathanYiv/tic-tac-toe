This is a tic-tac-toe game on the command line where two players can play against each other and the board is displayed in between turns.

There are two players
A simple board
Checking for victory in a game loop


Thoughts on structure...



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



