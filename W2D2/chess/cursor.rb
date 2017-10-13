require 'io/console'
require 'colorize'

KEYMAP = {
  ' '  => :space,
  'h' => :left,
  'j' => :down,
  'k' => :up,
  'l' => :right,
  'w' => :up,
  'a' => :left,
  's' => :down,
  'd' => :right,
  '\t' => :tab,
  '\r' => :return,
  '\n' => :newline,
  '\e' => :escape,
  '\e[A' => :up,
  '\e[B' => :down,
  '\e[C' => :right,
  '\e[D' => :left,
  '\177' => :backspace,
  '\004' => :delete,
  '\u0003' => :ctrl_c
  }

MOVES = {
  left: [0, -1],
  right: [0, 1],
  up: [-1, 0],
  down: [1, 0]
}

class Cursor

  attr_reader :cursor_pos, :board

  def initialize(cursor_pos, board)
    @cursor_pos = cursor_pos
    @board = board
  end

  def get_input
    key = KEYMAP[read_char]
    handle_key(key)
  end

  private

  def read_char
    STDIN.echo = false # stops the console from printing return values

    STDIN.raw! # in raw mode data is given as is to the program--the system
                 # doesn't preprocess special characters such as control-c

    input = STDIN.getc.chr # STDIN.getc reads a one-character string as a
                             # numeric keycode. chr returns a string of the
                             # character represented by the keycode.
                             # (e.g. 65.chr => A)

    if input == "\e" then
      input << STDIN.read_nonblock(3) rescue nil # read_nonblock(maxlen) reads
                                                   # at most maxlen bytes from a
                                                   # data stream; it's           g,
                                                   # meaning the meth                                                               #                  t raises                                                               if    dat       ailable,
                                                   # hence the need for rescue

      input << STDIN.read_nonblock(2) rescue nil
    end

    STDIN.echo = true # the console prints return values again
    STDIN.cooked! # the opposite of raw mode :)

    return input
  end

  def handle_key(key)
    case key
    when :up
      new_value = [(MOVES[:up].first + cursor_pos.first), cursor_pos.last]
      @cursor_pos = new_value if new_value.first === (0..7)

    when :left
      new_value = [cursor_pos.first, cursor_pos.last + MOVES[:left].last]
      @cursor_pos = new_value if new_value.first === (0..7)

    when :right
      new_value = [cursor_pos.first, cursor_pos.last + MOVES[:left].last]
      @cursor_pos = new_value if new_value.first === (0..7)

    when :down
      new_value = [(MOVES[:up].first + cursor_pos.first), cursor_pos.last]
      @cursor_pos = new_value if new_value.first === (0..7)

    when :return
      @cursor_pos
      Process.exit!(true)
    when :space
      @cursor_pos
      Process.exit!(true)
    end
     puts  "\033[1;33m"
  p  @cursor_pos #.colorize(:blue)
  end

  def update_pos(diff)
  end
end
