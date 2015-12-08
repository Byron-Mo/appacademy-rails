class Flash
  def initialize(req)
    cookie_str = req.cookies['_rails_lite_app']
    cookies = cookie_str ? JSON.parse(cookie_str) : {}
    @flashes = cookies[:flash]
  end

  def [](k)
    @flashes[k.to_s]
  end

  def [](k, v)
    @flashes[k.to_s] = v
  end
end
