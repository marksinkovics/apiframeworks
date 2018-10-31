require 'open3'

require_relative '../../scripts/utils/builder.rb'

class KituraBuilder < Builder


    attr_accessor :working_dir

    def initialize(arguments)
        super(arguments)
        @working_dir = File.join(__dir__, 'KituraApp')
    end

    def update
        update_status, generate_status = 0
        Log::log("Update packages...")
        Open3.popen3("swift package update", :chdir=>@working_dir) do |stdin, stdout, stderr, wait_thr|
            while line = stdout.gets
                Log::trace(line) if @arguments.verbose
            end
            update_status = wait_thr.value
        end

        Open3.popen3("swift package generate-xcodeproj", :chdir=>@working_dir) do |stdin, stdout, stderr, wait_thr|
            while line = stdout.gets
                Log::trace(line) if @arguments.verbose
            end
            generate_status = wait_thr.value
        end
        return update_status || generate_status
    end

    def build
        build_status = 0
        Log::log("Build packages...")
        Open3.popen3("swift build -c release", :chdir=>@working_dir) do |stdin, stdout, stderr, wait_thr|
            while line = stdout.gets
                Log::trace(line) if @arguments.verbose
            end
            build_status = wait_thr.value
        end
        return build_status
    end
end