require_relative '../../scripts/utils/validator.rb'

class VaporValidator < Validator
    def start
        @server_cmd = ".build/release/Run"
        @working_dir = File.join(__dir__, 'VaporApp')
        super
    end
end