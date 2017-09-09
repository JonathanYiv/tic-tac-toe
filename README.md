# Tic-Tac-Toe Project

Check out my command line version of the game [Tic-Tac-Toe](https://en.wikipedia.org/wiki/Tic-tac-toe) built with Ruby!

This is a project from [The Odin Project](https://www.theodinproject.com/courses/ruby-programming/lessons/oop).

![Tic-Tac-Toe](tictactoe.png)

## Installation
Open your Terminal/Command Line. Navigate to the directory where your version will live. Type in the following:
```
$ git clone https://github.com/JonathanYiv/tic-tac-toe.git
$ cd tic-tac-toe
$ ruby lib/game.rb
```

## Pre-Project Thoughts

The structure of the project should be something like:
```
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
 ```

## Post-Project Thoughts
1. I should separate the classes into different files for best practices, then call them in using the require keyword.

2. I feel like having the instance variable for whose turn it is inside of the class Mastermind added too much dependency between classes. I should have had each Player instance be able to hold a boolean for whether it is their turn or not.
3. I'm quite proud that the game can filter for incorrect input and reprompt you accordingly.

4. I wish there was a more elegant way to code for the solutions. I read about [magic squares](http://mathworld.wolfram.com/MagicSquare.html) where any row/column/diagonal will always sum to the same amount, so I thought assigning values to each component in the array and checking for the sum would have been possible. However, I believe that level of complexity is beyond the scope of this project.

5. I may one day include an AI that uses the optimal tic-tac-toe strategy shown in the below image from Wikipedia.

![Optimal TicTacToe](https://upload.wikimedia.org/wikipedia/commons/thumb/d/de/Tictactoe-X.svg/220px-Tictactoe-X.svg.png)

6. Through feedback provided from some [fellow Odinites](https://gitter.im/TheOdinProject/theodinproject), I modified my project to only initialize variables in the initialize method and separated a few methods into smaller methods. Previously, I had output and input statements in my initialize method and had a few larger methods doing too many things, all of which are poor practice.

7. @benjaminpetersen found an error where after an incorrect input, it no longer took capitalized letters. This was easily solved by adding #downcase to a variable.

8. In this [Odin Follow-Up Project](https://www.theodinproject.com/courses/ruby-programming/lessons/testing-ruby):

	1. I implemented a test suite for tic-tac-toe. This helped solidify some of the lessons I learned from writing this script: I should have separated the classes and reduced method dependency. I made a few changes accordingly that helped push the project in that direction.

	2. Following the last [follow-up project](https://github.com/JonathanYiv/enumerable_methods) where I integrated a test suite, I reflected on mocks/stubs being out of my comfort zone. I implemented a simple mock/stub in this test suite (although it is not related to the program) so I at least understand the syntax. After doing some reading, it appears that it is easy to misuse mocks in a way that make your tests poorly designed. A general rule of thumb is that if your testing needs a complicated object/interface as a parameter, and it would be a pain to just instantiate the object/interface, just use a mock. Going forward, I will definitely integrate unit and integration tests into my workflow, and experiment with mocks/stubs accordingly.

	3. This [first answer on StackOverflow](https://stackoverflow.com/questions/4904096/whats-the-difference-between-unit-functional-acceptance-and-integration-test) helped illuminate the different types of tests for me.
