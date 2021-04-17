require_relative "board.rb"


def start_game
    puts "Enter Player One's Name: "
    player1 = Player.new(gets.chomp)
    player1.sym = "X"

    puts "Enter Player Two's Name: "
    player2 = Player.new(gets.chomp)
    player2.sym = "O"
    
    if rand(0..1) == 1
        currentPlayer = player1
    else
        currentPlayer = player2
    end
    gameBoard = Board.new
    gameBoard.new_board
    
    
    while gameBoard.end_game == false do
        puts "\n#{currentPlayer.name}'s Turn!\n"
        userInput = gets.chomp.to_i
        range = (0..9)

        if range.include?(userInput) == true && gameBoard.check_space(userInput) == true 
            gameBoard.update_board(userInput, currentPlayer.symbol)
        else
            puts "\nInvalid Entry\n"
        end

        if gameBoard.check_winner == true
            currentPlayer = currentPlayer.name.upcase
            puts "\n#{currentPlayer} WINS!\n"
        elsif gameBoard.board_full == true
            puts "\nTIE GAME!"
        else
            currentPlayer = change_player(currentPlayer, player1, player2)
        end

    end
end

def change_player(currentPlayer, player1, player2)
    if currentPlayer.name == player1.name
        currentPlayer = player2
    else
        currentPlayer = player1
    end
end
