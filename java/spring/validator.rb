require_relative '../../scripts/utils/validator.rb'

class SpringValidator < Validator
    def start
        @server_cmd = "java -jar ./build/libs/SprintApp-0.1.0.jar"
        @working_dir = File.join(__dir__, 'SpringApp')
        super
    end
end