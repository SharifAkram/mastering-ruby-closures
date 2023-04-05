class SomeClass

    def method_that_calls_proc_or_lambda(procy)
        puts "calling #{proc_or_lambda(procy)} now!"
        procy.call
        puts "#{proc_or_lambda(procy)} gets called!"
    end

    def proc_or_lambda(proc_like_thing)
        proc_like_thing.lambda? ? "Lambda" : "Proc"
    end

end

c = SomeClass.new
puts c.method_that_calls_proc_or_lambda lambda { return }