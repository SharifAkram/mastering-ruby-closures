=begin

class Symbol
    def to_proc
        proc { |obj| obj.send(self) }
    end
end

class Symbol
    def to_proc
        lambda { |obj| obj.send(self) }
    end
end

words = %w(underwear should be worn on the inside)
p words.map &:length

p [1, 2, 3].inject(0) { |result, element| result + element }

=end

# the splat operator enables method to support a variable number of arguments

class Symbol
    def to_proc
        lambda { |obj, args| obj.send(self, *args) }
    end
end

p [1, 2, 3].inject(&:+)

# this does not work anymore: 

#words = %w(underwear should be worn on the inside)
# p words.map &:length

# to fix, supply args with a default value -> symbol_to_proc_lambda.rb 