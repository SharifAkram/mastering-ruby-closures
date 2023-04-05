# 1st way to call a proc

p = proc { |x, y| x + y }
puts p.call("oh", "ai")

puts p.call(4, 2)

# 2nd way

p = proc { |x, y| x + y }
p.("oh", "ai")
p.(4, 2)

class Carly
    def call(who)
        "call #{who}, maybe"
    end
end

c = Carly.new
puts c.("me")

# 3rd way

p = proc { |x, y| x + y }
puts p === ["oh", "ai"]

even = proc { |x| x % 2 == 0 }
case 11
    when even
        "number is even" 
    else
        "number is odd"
end

even = proc { |x| x % 2 == 0 }
puts even === 11
puts even === 10

# procs can accept any number of arguments. 
# lambdas can only accept the correct number of arguments assigned to it (arity).

# 4th way - Lambdas

puts lambda {}.class
puts proc {}.class

puts lambda {}.lambda?
puts proc {}.lambda?

# invoking lambdas

=begin

lambda { |x, y| x + y }.call(x, y)
lambda { |x, y| x + y }[x, y]
lambda { |x, y| x + y }.(x, y)
lambda { |x, y| x + y } === [x, y]

->(x, y) { x + y }.call(x, y)
->(x, y) { x + y }[x, y]
->(x, y) { x + y }.(x, y)
->(x, y) { x + y } === [x, y]

=end

# how symbol#to_proc works

# words.map { |s| s.length }
# words.map(&:length)

# sym#to_proc

class Object
    def to_proc
        proc {}
    end
end

obj = Object.new
print [1, 2, 3].map &obj

class Object
    def to_proc
        proc { |x| "Here's #{x}!" }
    end
end

obj = Object.new
print [1, 2, 3].map(&obj)

class Symbol
    def to_proc
        proc { |obj| obj }
    end
end

# print words.map(&:length) = words.map { |w| w.length }

class Symbol
    def to_proc
        proc { |obj| obj.length }
    end
end

print ["symbol", "cymbals", "sambal"].map(&:obj)

puts "ohai".send(:length)

# currying with procs

discriminant = lambda { |a, b, c| b**2 - 4*a*c }
p discriminant.call(5, 6, 7)

discriminant = lambda { |a| lambda { |b| lambda { |c| b**2 - 4*a*c } } }
p discriminant.call(5).call(6).call(7)

discriminant = lambda { |a, b, c| b**2 - 4*a*c }.curry
p discriminant.call(5).call(6).call(7)

greeter = lambda do |greeting, salutation, name|
    "#{greeting} #{salutation} #{name}"
end

p greeter.call("Dear", "Mr.", "Akram")

# construct a greeter that always starts with "Dear"

greeter = lambda do |greeting, salutation, name|
    "#{greeting} #{salutation} #{name}"
end

p dear_greeter = greeter.curry.call("Dear")

p dear_greeter.call("Great").call("Leader")

# better to write like this when .call() is verbose

p dear_greeter.("Great").("Leader")

# another example:

sums_ints = lambda do |start, stop|
    (start..stop).inject { |sum, x| sum + x }
end

sum_of_squares = lambda do |start, stop|
    (start..stop).inject { |sum, x| sum + x**2 }
end

sum_of_cubes = lambda do |start, stop|
    (start..stop).inject { |sum, x| sum + x**3 }
end

# some form of refactoring can occur - 

sum = lambda do |fun, start, stop|
    (start..stop).inject { |sum, x| sum + fun.call(x) }
end

sum_of_ints     = sum.(lambda { |x| x }, 1, 10)
sum_of_squares  = sum.(lambda { |x| x**2 }, 1, 10)
sum_of_cubes    = sum.(lambda { |x| x**3 }, 1, 10)

sum_of_squares = sum.curry.(lambda { |x| x**2 })

p sum_of_squares.(1).(10)
p sum_of_squares.(50).(100)