class Api::Facebook
  
  def self.friends_list(access_token)
    graph = Koala::Facebook::API.new(access_token)
    @friends = graph.get_connections("me", "friends")
  end
  
end