require 'webrick'

app = Rack::Builder.new do
  map '/' do
    use Rack::Static, urls: ['/'], root: 'public', index: 'index.html.erb'
    run lambda { |_env|
      [
        200,
        {
          'Content-Type': 'text/html',
          'Cache-Control': 'no-cache'
        },
        File.open('public/index.html.erb', File::RDONLY)
      ]
    }
  end
end

webrick_options = {
  Port: 3000,
  DocumentRoot: './public'
}

Signal.trap 'INT' do
  Rack::Handler::WEBrick.shutdown
end

Rack::Handler::WEBrick.run app, Port: 3000, DocumentRoot: './public'