require "./router.rb"

class Application
  attr_reader :router

  def initialize
    @router = Router.new

    @router.get('/') { 'Welcome to Rack Practice'}
    @router.get('/article') { 'All Articles' } 
    @router.get('/article/1') { 'First Articles' } 
  end

  def call(env)
    headers = {
      "Content-Type" => "text/html"
    }

    response = @router.build_response(env['PATH_INFO'])

    [200, headers, [response]]
  end
end