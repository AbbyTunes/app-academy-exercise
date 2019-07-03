require_relative 'tic_tac_toe'

class TicTacToeNode

  attr_reader :board, :next_mover_mark, :prev_move_pos
  
  def initialize(board, mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)

    if board.over?
      return board.winner != evaluator && board.won?
    end

    if self.next_mover_mark == evaluator 
      self.children.all? { |child| child.losing_node?(evaluator) }
    else
      self.children.any? { |child| child.losing_node?(evaluator) }
    end

  end

  def winning_node?(evaluator)

    if board.over?
      return board.winner == evaluator && board.won?
    end

    if self.next_mover_mark == evaluator 
      self.children.all? { |child| child.winning_node?(evaluator) }
    else
      self.children.any? { |child| child.winning_node?(evaluator) }
    end

  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    children = []

    (0..2).each do |row_i|
      (0..2).each do |col_i|
        pos = [row_i, col_i]
        
        next unless @board[pos] == nil
        
        new_board = @board.dup
        
        # self mark
        new_board[pos] = self.next_mover_mark 

        # next player mark
        next_mark = @next_mover_mark == :x ? :o : :x 
        
        children << TicTacToeNode.new(new_board, next_mark, pos)
      end
    end

    children
  end
end
