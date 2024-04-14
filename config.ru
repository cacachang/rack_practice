require 'webrick'
require './application'

app = Rack::Builder.new do
  run Application.new
end

Signal.trap 'INT' do
  Rack::Handler::WEBrick.shutdown
end

Rack::Handler::WEBrick.run app, Port: 3000