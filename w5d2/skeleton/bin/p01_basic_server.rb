require 'rack'

app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new
  res['Content_Type'] = 'text/html'
  res.write(req.path)
  res.finish
end

Rack::Server.start(
  app: app,
  Port: 9000
)
