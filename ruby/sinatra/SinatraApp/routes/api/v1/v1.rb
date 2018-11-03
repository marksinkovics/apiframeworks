require 'sinatra/base'

require_relative 'user.rb'

class V1Controller < Sinatra::Base
    use UserController
end