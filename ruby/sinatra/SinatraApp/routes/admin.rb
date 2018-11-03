require 'sinatra/base'

class AdminController < Sinatra::Base

    use Rack::Auth::Basic, "Protected Area" do |username, password|
        username == 'user' && password == 'password'
    end

    get "/admin" do
        "Welcome to admin page!"
    end
end
