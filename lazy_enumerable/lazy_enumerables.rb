# 1.upto(Float::INFINITY).map { |x| x * x }.take(10) 

p 1.upto(5).to_a 

# to_a() = force(); useful method when you want to 
# know all the values produced by an enumerator.

p 1.upto(Float::INFINITY).lazy.map { |x| x * x }.take(10)

p 1.upto(Float::INFINITY).lazy.map { |x| x * x }.take(10).to_a 

e = Enumerator.new do |yielder|
    [1,2,3].each do |val|
        yielder << val
    end
end

# << associated with yield. Stores instructions for the next yield. 

p e.next
p e.next
p e.next

# Generators and Fibers

# infinite number generator

f = Fiber.new do
    x = 0
    loop do
        Fiber.yield x
        x += 1
    end
end

p f 
p f.resume
p f.resume
p f.resume

# implementing lax

=begin

1.upto(Float::INFINITY)
.lax
.map { |x| x*x }
.map { |x| x + 1 }
.take(5)
.to_a

=end