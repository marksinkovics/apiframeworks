#!/usr/bin/env ruby

require "net/http"
require "uri"
require 'json'
require 'pp'

require 'test/unit'
require 'test/unit/testsuite'
require 'test/unit/ui/console/testrunner'

require_relative 'utils/validator.rb'

class ExpressTests < Test::Unit::TestCase

    attr_accessor :uri, :http

    def self.startup
        server_cmd = "node src/index.js"
        working_dir = File.join(__dir__, '..', 'node', 'express', 'ExpressApp')
        @@server = Server.new(server_cmd, working_dir)
        @@server.start
    end

    def self.shutdown
      @@server.stop
    end

    def setup
      @uri = URI.parse("http://localhost:8080")
      @http = Net::HTTP.new(uri.host, uri.port)
    end

    def teardown

    end

    def test_api_versioning
      request = Net::HTTP::Get.new('/api/1/user')
      response = @http.request(request)
      assert(response.kind_of?(Net::HTTPSuccess))
    end

    def test_creating_new_user
      request = Net::HTTP::Post.new('/api/1/user')
      request.set_form_data({"username" => "user1"})
      response = @http.request(request)
      assert(response.kind_of?(Net::HTTPOK))
    end

    def test_basic_authentication
    end

    def test_routing
      request = Net::HTTP::Get.new('/api/1/user/1')
      response =  @http.request(request)
      user = JSON.parse(response.body)
      assert_equal('user1', user['username'], 'Not valid username')
    end

    def test_renaming
      # request = Net::HTTP::Put.new('/api/1/user/1')
      # request.set_form_data({"username" => "renamed_user"})
      # response =  @http.request(request)
      # user = JSON.parse(response.body)
      # pp user
      # assert_equal('renamed_user', user['username'], 'Not valid username')
    end

    def test_deleting
    end

    def test_authentication
    end
end

class TS_MyTests
  def self.suite
    suite = Test::Unit::TestSuite.new
    suite << ExpressTests.suite
    return suite
  end
end

# Test::Unit::UI::Console::TestRunner.run(TS_MyTests, 3)
