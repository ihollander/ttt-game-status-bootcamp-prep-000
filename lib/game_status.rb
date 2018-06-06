# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #top row  
  [3,4,5], #mid row
  [6,7,8], #bottom row
  [0,4,8], #diag top left
  [2,4,6], #diag top right
  [0,3,6], #left col
  [1,4,7], #mid col
  [2,5,8]  #right col
]

def won?(board)
  WIN_COMBINATIONS.each do |win_array| #iterate through win conditions
    if position_taken?(board, win_array[0]) #check if first position of win condition is taken
      token = board[win_array[0]] #get the token from the first position to check
      if win_array.all? do |position| #check if all positions in the win condition have the token
          board[position] == token
        end
        return win_array #return the win condition
      end  
    end
  end
  false
end

def full?(board)
  board.all?{|position| position == "X" || position == "O"}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  winning_board = won?(board)
  if winning_board
    board[winning_board[0]]
  end
end