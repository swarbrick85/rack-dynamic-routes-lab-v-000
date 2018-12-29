require 'pry'

class Application
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if !req.path.match(/items/)
      resp.write "Route not found"
      resp.status = 404
    elsif req.path.match(/items/)
      item = req.env["PATH_INFO"].split("/items/")[1]
      binding.pry
      if (@@items.find {|itemm| itemm.name == item})
        resp.write "#{(@@items.find {|itemm| itemm.name == item}).price}"
      else 
        resp.write "Item not found"
      end 
    end 
    resp.finish
  end 
end
