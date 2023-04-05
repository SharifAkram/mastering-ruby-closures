require 'ostruct'

catalog = []

catalog << OpenStruct.new(name: 'Nike', qty: 20, price: 99.00)
catalog << OpenStruct.new(name: 'Adidas', qty: 10, price: 109.00)
catalog << OpenStruct.new(name: 'New Balance', qty: 2, price: 89.00)

# lowest price first

puts catalog.sort_by { |x| x.price }

puts catalog.sort_by { |x| x.qty }.reverse

=begin

def do_it
    yield
end

do_it { puts "I'm doing it" }

do_it { [1,2,3] << 4 }

def do_it(x, y)
    yield(x, y)
end

do_it(2, 3) { |x, y| x + y }

do_it("ohai", "benevolent dictator") do |greeting, title|
    "#{greeting}, #{title} !!!"
end

def do_it(x)
    yield x
end

do_it(42) { |num, line| "#{num}: #{line}" }

def do_it
    yield "this", "is", "ignored!"
end

do_it { puts "Ohai!" }

def chalkboard_gag(line, repetition)
    repetition.times { |x| puts "#{x}: #{line}" }
end
chalkboard_gag("I will not drive the principal's car", 3)

=end

# block local variables are declared after semicolon:

def chalkboard_gag(line, repetition)
    repetition.times { |x; line| puts "#{x}: #{line}" }
end
chalkboard_gag("I will not drive the principal's car", 3)

x = "outside x"
1.times { x = "modified from outside block" }
puts x

# to block before outer scope variable

x = "outside x"
1.times { |;x| x = "modified from outside block" }
puts x

%w(look ma no for loops).each do |x|
    puts x
end

# Fixnum#times method

3.times { puts "D'oh!" }

=begin

# opening a file, example

File.open('Leo Tolstoy - War and Peace.txt', w)
"Well, Prince, so Genoa and Lucca"
"are now just family estates of the Buonapartes."
f.close

File.open('Leo Tolstoy - War and Peace.txt', w) do |f|
    "Well, Prince, so Genoa and Lucca"
    "are now just family estates of the Buonapartes."
end

=end

# Twitter Ruby Gem

client = Twitter::REST::Client.new do |config|
    config.consumer_key         ="YOUR_CONSUMER_KEY"
    config.consumer_secret      ="YOUR_CONSUMER_SECRET"
    config.access_token         ="YOUR_ACCESS_TOKEN"
    config.access_token_secret  ="YOUR_ACCESS_SECRET"
end

# Implementing a router DSL

# routes are rules that you declare for an incoming web request
# these rules invoke the appropriate controller and controller method

# In Rails: config/routes.rb

# old:

routes = Router.new do |r|
    r.match '/about' => 'home#about'
    r.match '/users' => 'users#index'
end

# new:

routes = Router.new do
    match '/about' => 'home#about'
    match '/users' => 'users#index'
end

# &block captured block into a proc object.

# Block -> Proc if &block is in a method argument.
# Proc -> Block if &block is in method body.

# object initialization - revisited

client = Twitter::REST::Client.new({consumer_key: "YOUR_CONSUMER_KEY"}) do
    config.consumer_secret      ="YOUR_CONSUMER_SECRET"
    config.access_token         ="YOUR_ACCESS_TOKEN"
    config.access_token_secret  ="YOUR_ACCESS_SECRET"
end

def initialization(options = {}, &block)
    options.each { |k, v| send("#{k}=", v) }
    instance_eval(&block) if block_given?
end

