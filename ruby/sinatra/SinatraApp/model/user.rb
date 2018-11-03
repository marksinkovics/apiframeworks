require 'json'

class User

  attr_accessor :id, :username

  def initialize(id=nil, username=nil)
      @id = id
      @username = username
  end

  def update(user)
    @username = user.username unless user.username.nil?
  end

  def to_hash
    { :id => @id, :username => @username }
  end

  def to_json(*a)
    {'id' => @id, 'username' => @username}.to_json(*a)
  end

  def self.fromJSON(user_hash)
    User.new(user_hash["id"], user_hash["username"])
  end

end