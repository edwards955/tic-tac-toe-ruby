class Player
  attr_reader :name, :mark

  def initialize(name, mark)
    @name = name
    @mark = mark
  end

  def take_turn()
    puts "#{name}, choose a cell"
    choice = gets.chomp.to_i
    choice
  end
end

class Board
  attr_accessor :cells

  def initialize()
    @cells = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  end

  def print_board()
    puts
    puts "|  #{cells[0][0]}  |  #{cells[0][1]}  |  #{cells[0][2]}  |"
    puts "|  #{cells[1][0]}  |  #{cells[1][1]}  |  #{cells[1][2]}  |"
    puts "|  #{cells[2][0]}  |  #{cells[2][1]}  |  #{cells[2][2]}  |"
    puts
  end
  
  def update_board(cell, mark)
    case cell
    when 1
      cells[0][0] = mark
    when 2
      cells[0][1] = mark
    when 3
      cells[0][2] = mark
    when 4
      cells[1][0] = mark
    when 5
      cells[1][1] = mark
    when 6
      cells[1][2] = mark
    when 7
      cells[2][0] = mark
    when 8
      cells[2][1] = mark
    when 9
      cells[2][2] = mark
    else
      puts 'Incorrect cell value entered'
    end
  end

  def check_for_winner()
    if cells[0][0] == cells[0][1] && cells[0][1] == cells[0][2]
      true
    elsif cells[1][0] == cells[1][1] && cells[1][1] == cells[1][2]
      true
    elsif cells[2][0] == cells[2][1] && cells[2][1] == cells[2][2]
      true
    elsif cells[0][0] == cells[1][0] && cells[1][0] == cells[2][0]
      true
    elsif cells[0][1] == cells[1][1] && cells[1][1] == cells[1][2]
      true
    elsif cells[0][2] == cells[1][2] && cells[1][2] == cells[2][2]
      true
    elsif cells[0][0] == cells[1][1] && cells[1][1] == cells[2][2]
      true
    elsif cells[0][2] == cells[1][1] && cells[1][1] == cells[2][0]
      true
    else
      false
    end
  end
end