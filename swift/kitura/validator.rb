require_relative '../../scripts/utils/validator.rb'

class KituraValidator < Validator
    def start
        @server_cmd = ".build/release/KituraApp"
        @working_dir = File.join(__dir__, 'KituraApp')
        super
    end
end