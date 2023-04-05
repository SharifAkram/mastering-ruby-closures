# no block

class File
    def self.open(name, mode)
        new(name, mode) unless block_given?
    end 
end

# if there is a block

class File
    def self.open(name, mode)
        file = new(name, mode)
        return files unless block_given?
        yield(file)
    end
end

# block termination

class File
    def self.open(name, mode)
        file = new(name, mode)
        return files unless block_given?
        yield(file)
    ensure
        file.close
    end
end 