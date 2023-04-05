# Should print: 

# {'/about' => 'home#about'}
# {'/users' => 'users#index'}

class Router
    def initialize(&block)
        # self is the router instance
        instance_eval &block
    end

    def match(route)
        puts route
    end
end 

routes = Router.new do
    match '/about' => 'home#about'
    match '/users' => 'users#index'
end
