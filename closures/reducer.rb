# write in irb

reducer = lambda do |acc, arr, binary_function|
    reducer_aux = lambda do |acc, arr|
        if arr.empty?
            acc
        else
            reducer_aux.call(binary_function.call(acc, arr.first), arr.drop(1))
        end
    end

    reducer_aux.call(acc, arr)
end

reducer.call(1, [1,2,3,4,5], lambda { |x, y| x + y })