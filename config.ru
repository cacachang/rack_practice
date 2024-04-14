require 'webrick'

server = WEBrick::HTTPServer.new(Port: 3000)

server.mount_proc '/' do |req, res|
  res.body = File.open('public/index.html.erb', File::RDONLY)
end

trap 'INT' do server.shutdown end
server.start