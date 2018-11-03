require 'sinatra/base'
require 'json'

require_relative '../../../database/database.rb'

class UserController < Sinatra::Base

    before do
        content_type 'application/json'
    end

    get "/api/1/user" do
        JSON.pretty_generate(Database.instance.users)
    end

    get "/api/1/user/:id" do |id|
        JSON.pretty_generate(Database.instance.user(id.to_i))
    end

    post "/api/1/user" do
        user_hash = JSON.parse(request.body.read)
        user = User.fromJSON(user_hash)
        Database.instance.add_user(user)
        user.to_json
    end

    put "/api/1/user/:id" do |id|
        user_hash = JSON.parse(request.body.read)
        updated_user = User.fromJSON(user_hash)
        user =  Database.instance.user(id.to_i)
        user.update(updated_user)
        user.to_json
    end

    delete "/api/1/user/:id" do |id|
        Database.instance.remove_user(id.to_i)
    end
end