# supply args with a default value:

class Symbol
    def to_proc
        lambda { |obj, args=nil| obj.send(self, *args) }
    end
end

words = %w(underwear should be worn on the inside)
p words.map &:length

# this is one of the few places where having a more relaxed requirement with 
# respect to arities is important and even required:

class Symbol
    def to_proc
        proc { |obj, args| obj.send(self, *args) }
    end
end

words = %w(underwear should be worn on the inside)
p words.map &:length

p [1, 2, 3].inject(&:+)