require_relative '../../scripts/utils/validator.rb'

class SinatraValidator < Validator
    def start
        @server_cmd = "ruby app.rb"
        @working_dir = File.join(__dir__, 'SinatraApp')
        super
    end
end