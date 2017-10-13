require 'colorize'
def example
  8.times do |y|

    8.times do |x|
      if (x.odd? && y.even?) || (x.even? && y.odd?)
        print "  ".colorize(background: :red)
      else
        print "  ".colorize(background: :white)
      end
    end
    puts ""
  end
end

example
