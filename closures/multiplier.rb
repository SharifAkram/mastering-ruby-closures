# write in irb

multiplier = lambda do |acc, arr|
    if arr.empty?
        acc
    else
        multiplier.call(acc * arr.first, arr.drop(1))
    end
end

multiplier.call(2, [2, 4, 6])

