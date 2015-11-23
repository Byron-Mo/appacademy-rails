require 'addressable/uri'
require 'rest-client'

def index
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/',
    # query_values: {
    #   'mystery[key]' => 'its a mystery',
    #   'other[thing][in_paris]' => 'hello',
    #   'no_doubt' => 'your_move'
    # }
  ).to_s

  # user_data = {"name" => "byron", "password" => "hello"}
  puts RestClient.get(url)
end

def create_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/',
  ).to_s

  puts RestClient.post(url, { user: {name: "patrck", email: "patrickemail"}})
end

def show
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/1',
  ).to_s

  puts RestClient.get(url)
end

def update
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/1',
  ).to_s

  puts RestClient.put(url, { user: { name: "david", email: "but still byron" } })
end

def delete
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/4',
  ).to_s

  puts RestClient.delete(url)
end

# delete
index
