
class Router
  def initialize
    @routes = {}
  end

  def get(path, &block)
    @routes[path] = block
  end

  def build_response(path)
    puts @routes
    handler = @routes[path] || -> { "no route found for #{path}" } 
    handler.call
  end
end