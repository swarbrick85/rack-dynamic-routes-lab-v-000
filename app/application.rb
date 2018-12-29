require 'pry'

class Application

  @@cart = []
  
  @@items = [Item.new("avocado", 7.39), Item.new("apple", 0.75)]
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if !req.path.match(/items/)
      resp.write "Route not found"
      resp.status = 404
    end 
  end 
end
