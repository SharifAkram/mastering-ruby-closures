=begin

class Fixnum
    def times
        x = 0
        while x < self
            x += 1
            yield
        end
        self
    end
end

Causes irb to crash when using Fixnum#method

=end

