require 'sinatra/base'

require_relative '../database/database.rb'

class AdminController < Sinatra::Base
    use Rack::Auth::Basic, "Protected Area" do |username, password|
        user = Database.instance.userByName(username)
        user.password == password
    end

    get "/admin" do
        "Admin page"
    end
end
