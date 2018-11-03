require 'sinatra/base'

require_relative 'v1/v1.rb'

class APIController < Sinatra::Base
    use V1Controller
end
