# Very simple counter program:
# Get the current value of the counter
# Increment the counter
# Decrement the counter

class Counter
    def initialize
        @x = 0
    end

    def get_x
        @x 
    end

    def incr
        @x += 1
    end

    def decr
        @x -= 1
    end
end

c = Counter.new
c.incr

