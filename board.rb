class Board
    attr_accessor :bA

    def initialize
        @bA = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    end

    def update_board(num, sym)
        @bA[num - 1] = sym
        new_board
    end

    def new_board
        puts "\n"
        puts "  #{@bA[0]}  |  #{@bA[1]}  |  #{@bA[2]}  "
        puts "-----------------"
        puts "  #{@bA[3]}  |  #{@bA[4]}  |  #{@bA[5]}  "
        puts "-----------------"
        puts "  #{@bA[6]}  |  #{@bA[7]}  |  #{@bA[8]}  "
    end
    def check_winner
        
        winners = [
        [@bA[0],@bA[1],@bA[2]], 
        [@bA[3],@bA[4],@bA[5]], 
        [@bA[6],@bA[7],@bA[8]],
        [@bA[0],@bA[3],@bA[6]], 
        [@bA[1],@bA[4],@bA[7]], 
        [@bA[2],@bA[5],@bA[8]],
        [@bA[0],@bA[4],@bA[8]], 
        [@bA[2],@bA[4],@bA[6]],
               ] 
    
        winners.each do |winner|
            if winner.uniq.size == 1
                return true
            end
        end
    end

    def check_space(userInput)
        if @bA[userInput - 1].is_a? Integer
            return true
        end
    end

    def board_full
        @bA.all? { |j| j.is_a? String }
    end

    def end_game
        if check_winner == true || board_full == true
            return true
        else
            return false
        end
    end
end