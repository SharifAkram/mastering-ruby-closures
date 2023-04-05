# write in irb

# [1, 2, 3, 4, 5].reduce(10) { |acc, x| p "#{acc}, #{x}"; acc + x }

adder = lambda do |acc, arr|
    if arr.empty?
        acc
    else
        adder.call(acc + arr.first, arr.drop(1))
    end
end

adder.call(10, [1,2,3,4,5])