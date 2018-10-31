require_relative '../../scripts/utils/validator.rb'

class ExpressValidator < Validator
    def start
        @server_cmd = "node src/index.js"
        @working_dir = File.join(__dir__, 'ExpressApp')
        super
    end
end