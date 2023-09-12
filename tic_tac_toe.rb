require 'pry-byebug'

class Player
  attr_reader :name, :mark

  def initialize(name, mark)
    @name = name
    @mark = mark
  end

  def take_turn()
    puts "#{name}, choose a cell"
    need_choice = true
    while need_choice
      choice = gets.chomp.to_i
      if choice.between?(1, 9)
        need_choice = false
      else
        puts 'Invalid cell. Choose again.'
      end
    end
    choice
  end
end

class Board
  attr_accessor :cells

  def initialize
    @cells = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  end

  def print_board
    puts
    puts "|  #{cells[0][0]}  |  #{cells[0][1]}  |  #{cells[0][2]}  |"
    puts "|  #{cells[1][0]}  |  #{cells[1][1]}  |  #{cells[1][2]}  |"
    puts "|  #{cells[2][0]}  |  #{cells[2][1]}  |  #{cells[2][2]}  |"
    puts
  end

  def update_board(cell, mark)
    case cell
    when 1
      if cells[0][0].is_a? Integer
        cells[0][0] = mark
        true
      else
        false
      end
    when 2
      if cells[0][1].is_a? Integer
        cells[0][1] = mark
        true
      else
        false
      end
    when 3
      if cells[0][2].is_a? Integer
        cells[0][2] = mark
        true
      else
        false
      end
    when 4
      if cells[1][0].is_a? Integer
        cells[1][0] = mark
        true
      else
        false
      end
    when 5
      if cells[1][1].is_a? Integer
        cells[1][1] = mark
        true
      else
        false
      end
    when 6
      if cells[1][2].is_a? Integer
        cells[1][2] = mark
        true
      else
        false
      end
    when 7
      if cells[2][0].is_a? Integer
        cells[2][0] = mark
        true
      else
        false
      end
    when 8
      if cells[2][1].is_a? Integer
        cells[2][1] = mark
        true
      else
        false
      end
    when 9
      if cells[2][2].is_a? Integer
        cells[2][2] = mark
        true
      else
        false
      end
    else
      puts 'Incorrect cell value entered'
    end
  end

  def check_for_winner
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

  def check_for_draw
    cells.flatten.none?(Integer)
  end
end

class GameController
  attr_accessor :p1, :p2, :board, :game_over, :current_player
  
  def initialize
    puts 'Enter name for Player 1 (X):'
    name = gets.chomp
    @p1 = Player.new(name, 'X')
    puts 'Enter name for Player 2 (O):'
    name = gets.chomp
    @p2 = Player.new(name, 'O')
    @board = Board.new
    @game_over = false
    @current_player = p1
  end

  def change_player_turn
    self.current_player = current_player == p1 ? p2 : p1
  end

  def play_round(player)
    board.print_board
    choice = player.take_turn
    board.update_board(choice, player.mark)
  end

  def play
    draw = false
    until game_over == true
      play_round(current_player)
      if board.check_for_winner
        self.game_over = true
        puts
        puts "#{current_player.name} wins!"
      elsif board.check_for_draw
        self.game_over = true
        draw = true
      end
      change_player_turn
    end
    board.print_board
    puts "It's a draw!" if draw == true
  end
end

my_game = GameController.new
my_game.play