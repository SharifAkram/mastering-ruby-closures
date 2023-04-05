module Enumerable
    def lax
        Lax.new(self)
    end
end

class Lax < Enumerator
    # populate the yielder
    def initialize(receiver)
        super() do |yielder|
            receiver.each do |val|
                yielder << val
            end
        end
    end
end

e = 1.upto(Float::INFINITY).lax

p e 
p e.next
p e.next
p e.next 

# super versus super()
