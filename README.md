# Tic-Tac-Toe Project

Check out my command line version of the game [Tic-Tac-Toe](https://en.wikipedia.org/wiki/Tic-tac-toe) built with Ruby!

This is a project from [The Odin Project](https://www.theodinproject.com/courses/ruby-programming/lessons/oop).

![Tic-Tac-Toe](/tictactoe.png)

## Installation
Open your Terminal/Command Line. Navigate to the directory where your version will live. Type in the following:
```
$ git clone https://github.com/JonathanYiv/tic-tac-toe.git
$ cd tic-tac-toe
$ ruby tictactoe.rb
```

## Post-Project Thoughts
1. I should separate the classes into different files for best practices, then call them in using the require keyword.

2. I feel like having the instance variable for whose turn it is inside of the class Mastermind added too much dependency between classes. I should have had each Player instance be able to hold a boolean for whether it is their turn or not.
3. I'm quite proud that the game can filter for incorrect input and reprompt you accordingly.

4. I wish there was a more elegant way to code for the solutions. I read about [magic squares](http://mathworld.wolfram.com/MagicSquare.html) where any row/column/diagonal will always sum to the same amount, so I thought assigning values to each component in the array and checking for the sum would have been possible. However, I believe that level of complexity is beyond the scope of this project.

5. I may one day include an AI that uses the optimal tic-tac-toe strategy shown in the below image from Wikipedia.

![Optimal TicTacToe](https://upload.wikimedia.org/wikipedia/commons/thumb/d/de/Tictactoe-X.svg/220px-Tictactoe-X.svg.png)
