
require 'open3'
require 'pp'

require_relative 'parser.rb'
require_relative 'colorize.rb'
require_relative 'log.rb'

class Server
    attr_accessor :child_pid, :server_cmd, :working_dir
    attr_accessor :arguments

    def initialize(server_cmd, working_dir)
        @server_cmd = server_cmd
        @working_dir = working_dir
        @arguments = arguments
    end

    def start
        @child_pid = spawn(@server_cmd,
            :chdir=>@working_dir,
            :pgroup => true,
            :out=>"/dev/null",
            :err=>"/dev/null"
        )
        sleep(0.5)
        # Log::info("Process started: #{child_pid}")
    end

    def stop
        # Help: https://github.com/travis-ci/travis-ci/issues/8811
        Process.kill(-9, -@child_pid)
        # Log::info("Process finished: #{child_pid}")
    end
end


class Validator

    attr_accessor :child_pid, :server_cmd, :working_dir
    attr_accessor :arguments
    attr_accessor :server

    class Command
        attr_accessor :name, :command
        def initialize(name, command)
            @name = name
            @command = "http --check-status --ignore-stdin --timeout=2.5  #{command}"
        end

        def handle_error(code)
            case code.exitstatus
            when 2 then "Request timed out!"
            when 3 then "Unexpected HTTP 3xx Redirection!"
            when 4 then "HTTP 4xx Client Error!"
            when 5 then "HTTP 5xx Server Error!"
            when 6 then "Exceeded --max-redirects=<n> redirects!"
            else "Other Error! Code: #{code.exitstatus}"
            end
        end

        def run
            _, _, status = Open3.capture3(@command)
            if status.success?
                puts("OK".green)
            else
                puts(handle_error(status).red)
            end
        end
    end

    COMMANDS = [
        Command.new('Basic API versioning', "GET localhost:8080/api/1/user"),
        Command.new("Create new user",  "POST localhost:8080/api/1/user username=\"user1\""),
        Command.new("Router parameter handling", "GET localhost:8080/api/1/user/1"),
        Command.new("Basic authentication with user1", "-a user1:password GET localhost:8080/admin"),
        Command.new("Rename user with id 1", "PUT localhost:8080/api/1/user/1 username=\"renamed_user1\""),
        Command.new("Delete user with id 1", "DELETE localhost:8080/api/1/user/1"),
    ]

    def initialize(arguments)
        @arguments = arguments
    end

    def validate
        COMMANDS.each_with_index { |command, index|
            Log::info(command.command) if @arguments.verbose
            print("==> Test #{index + 1} - #{command.name}: ")
            command.run
        }
    end

    def start
        @server.start
        # @child_pid = spawn(@server_cmd,
        #     :chdir=>@working_dir,
        #     :pgroup => true,
        #     :out=>"/dev/null",
        #     :err=>"/dev/null"
        # )
        # sleep(0.5)
        # Log::info("Process started: #{child_pid}") if @arguments.verbose
    end

    def stop
        @server.stop
        # # Help: https://github.com/travis-ci/travis-ci/issues/8811
        # Process.kill(-9, -@child_pid)
        # Log::info("Process finished: #{child_pid}") if @arguments.verbose
    end

end