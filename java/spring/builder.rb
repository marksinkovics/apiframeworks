require 'open3'

require_relative '../../scripts/utils/builder.rb'

class SpringBuilder < Builder

    def initialize(arguments)
        super(arguments)
        @working_dir = File.join(__dir__, 'SpringApp')
    end

    def update
        update_status = 0
        Log::log("Update packages...")
        Open3.popen3("./gradlew build --refresh-dependencies", :chdir=>@working_dir) do |stdin, stdout, stderr, wait_thr|
            while line = stdout.gets
                Log::trace(line) if @arguments.verbose
            end
            update_status = wait_thr.value
        end
        return update_status
    end

    def build
        build_status = 0
        Log::log("Build packages...")
        Open3.popen3("./gradlew bootJar", :chdir=>@working_dir) do |stdin, stdout, stderr, wait_thr|
            while line = stdout.gets
                Log::trace(line) if @arguments.verbose
            end
            build_status = wait_thr.value
        end
        return build_status

    end
end