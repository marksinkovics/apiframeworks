require 'singleton'
require 'pp'

require_relative '../model/user.rb'

class Database
    include Singleton

    attr_accessor :counter, :users

    def initialize
        @counter = 1
        @users = []
    end

    def user(id)
        @users.detect { |user| user.id == id }
    end

    def userByName(name)
        @users.detect { |user| user.username == name }
    end

    def users
        @users
    end

    def add_user(user)
        user.id = @counter
        @counter += 1
        @users.push(user)
    end

    def remove_user(id)
        @users.delete_if { |user| user.id == id }
    end
end